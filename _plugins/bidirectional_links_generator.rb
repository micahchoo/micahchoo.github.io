# frozen_string_literal: true
class BidirectionalLinksGenerator < Jekyll::Generator
  def slugify(text)
    text.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def generate(site)
    graph_nodes = []
    graph_edges = []

    all_notes = site.collections['notes'].docs
    all_pages = site.pages

    all_docs = all_notes + all_pages

    link_extension = !!site.config["use_html_extension"] ? '.html' : ''

    all_docs.each do |current_note|
      all_docs.each do |note_potentially_linked_to|
        note_title_regexp_pattern = Regexp.escape(
          File.basename(
            note_potentially_linked_to.basename,
            File.extname(note_potentially_linked_to.basename)
          )
        ).gsub('\_', '[ _]').gsub('\-', '[ -]').capitalize

        title_from_data = note_potentially_linked_to.data['title']
        if title_from_data
          title_from_data = Regexp.escape(title_from_data)
        end

        base_url = site.baseurl
        note_url = note_potentially_linked_to.url.split("/").map { |part| slugify(part) }.join("/")
        new_href = "#{base_url}#{note_url}#{link_extension}"

        # Prepare the anchor tag template, to be used in gsub
        anchor_tag = "<a class='internal-link' href='#{new_href}\\2'>\\1</a>"

        # Regex part to capture optional section
        section_regex = "(#[^\\]]*?)?"

        # Replace double-bracketed links with label using note title
        current_note.content.gsub!(
          /\[\[#{note_title_regexp_pattern}#{section_regex}\|(.+?)(?=\])\]\]/i,
          anchor_tag.gsub("\\2", "#{slugify("\\2")}")  # replace the \\2 placeholder in the anchor tag with the slugified section
        )

        # Replace double-bracketed links with label using note filename
        current_note.content.gsub!(
          /\[\[#{title_from_data}#{section_regex}\|(.+?)(?=\])\]\]/i,
          anchor_tag.gsub("\\2", "#{slugify("\\2")}")
        )

        # Replace double-bracketed links using note title
        current_note.content.gsub!(
          /\[\[(#{title_from_data}#{section_regex})\]\]/i,
          anchor_tag.gsub("\\2", "#{slugify("\\2")}")
        )

        # Replace double-bracketed links using note filename
        current_note.content.gsub!(
          /\[\[(#{note_title_regexp_pattern}#{section_regex})\]\]/i,
          anchor_tag.gsub("\\2", "#{slugify("\\2")}")
        )
      end

      current_note.content = current_note.content.gsub(
        /\[\[([^\]]+)\]\]/i,
        <<~HTML.delete("\n")
          <span title='There is no note that matches this link.' class='invalid-link'>
            <span class='invalid-link-brackets'>[[</span>
            \\1
            <span class='invalid-link-brackets'>]]</span></span>
        HTML
      )
    end

    all_notes.each do |current_note|
      notes_linking_to_current_note = all_notes.filter do |e|
        e.content.include?(current_note.url)
      end

      graph_nodes << {
        id: note_id_from_note(current_note),
        path: "#{site.baseurl}#{current_note.url}#{link_extension}",
        label: current_note.data['title'],
      } unless current_note.path.include?('_notes/index.html')

      current_note.data['backlinks'] = notes_linking_to_current_note

      notes_linking_to_current_note.each do |n|
        graph_edges << {
          source: note_id_from_note(n),
          target: note_id_from_note(current_note),
        }
      end
    end

    File.write('_includes/notes_graph.json', JSON.dump({
      edges: graph_edges,
      nodes: graph_nodes,
    }))
  end

  def note_id_from_note(note)
    note.data['title'].bytes.join
  end
end
