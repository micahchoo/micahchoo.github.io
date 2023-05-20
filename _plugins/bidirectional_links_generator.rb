# frozen_string_literal: true

class BidirectionalLinksGenerator < Jekyll::Generator
  def slugify(text)
    text.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def generate(site)
    all_docs = site.collections['notes'].docs + site.pages
    link_extension = !!site.config["use_html_extension"] ? '.html' : ''

    process_links(site, all_docs, link_extension)
    generate_backlinks(site, all_docs, link_extension)
  end

  def process_links(site, all_docs, link_extension)
    all_docs.each do |current_note|
      all_docs.each do |note_potentially_linked_to|
        note_title_regexp_pattern = generate_title_regexp_pattern(note_potentially_linked_to)
        title_from_data = note_potentially_linked_to.data['title']
        title_from_data = Regexp.escape(title_from_data) if title_from_data

        base_url = site.baseurl
        note_url = generate_note_url(note_potentially_linked_to)
        new_href = "#{base_url}#{note_url}#{link_extension}"
        anchor_tag = "<a class='internal-link' href='#{new_href}\\2'>\\1</a>"

        process_content(current_note, note_title_regexp_pattern, title_from_data, anchor_tag)
      end
      replace_remaining_links(current_note)
    end
  end

  def generate_title_regexp_pattern(note)
    Regexp.escape(
      File.basename(
        note.basename,
        File.extname(note.basename)
      )
    ).gsub('\_', '[ _]').gsub('\-', '[ -]').capitalize
  end

  def generate_note_url(note)
    note.url.split("/").map { |part| slugify(part) }.join("/")
  end

  def process_content(current_note, note_title_regexp_pattern, title_from_data, anchor_tag)
    replace_labeled_links(current_note, note_title_regexp_pattern, title_from_data, anchor_tag)
    replace_direct_links(current_note, note_title_regexp_pattern, title_from_data, anchor_tag)
  end

  def replace_labeled_links(current_note, note_title_regexp_pattern, title_from_data, anchor_tag)
    # Replace double-bracketed links with label using note title
    current_note.content.gsub!(/\[\[#{note_title_regexp_pattern}(#.*?)?\|(.+?)(?=\])\]\]/i, anchor_tag)

    # Replace double-bracketed links with label using note filename
    current_note.content.gsub!(/\[\[#{title_from_data}(#.*?)?\|(.+?)(?=\])\]\]/i, anchor_tag) if title_from_data
  end

  def replace_direct_links(current_note, note_title_regexp_pattern, title_from_data, anchor_tag)
    # Replace double-bracketed links using note title
    current_note.content.gsub!(/\[\[(#{title_from_data}(#.*?)?)\]\]/i, anchor_tag) if title_from_data

    # Replace double-bracketed links using note filename
    current_note.content.gsub!(/\[\[(#{note_title_regexp_pattern})(#.*?)?\]\]/i, anchor_tag)
  end

  def replace_remaining_links(current_note)
    current_note.content.gsub!(/\[\[([^\]]+)\]\]/i) { non_existing_page_link_html($1) }
  end

  def non_existing_page_link_html(replacement_text)
    <<~HTML.delete("\n")
      <span title='There is no note that matches this link.' class='invalid-link'>
        <span class='invalid-link-brackets'>[[</span>
        #{replacement_text}
        <span class='invalid-link-brackets'>]]</span></span>
    HTML
  end


  def generate_backlinks(site, all_docs, link_extension)
    graph_nodes = []
    graph_edges = []

    all_notes = all_docs.filter { |doc| doc.collection.label == 'notes' }

    all_notes.each do |current_note|
      notes_linking_to_current_note = all_notes.filter { |e| e.content.include?(current_note.url) }

      add_graph_node(graph_nodes, current_note, site.baseurl, link_extension)
      update_backlinks(current_note, notes_linking_to_current_note)
      add_graph_edges(graph_edges, notes_linking_to_current_note, current_note)
    end

    write_graph_to_file(graph_nodes, graph_edges)
  end

  def add_graph_node(graph_nodes, current_note, baseurl, link_extension)
    graph_nodes << {
      id: note_id_from_note(current_note),
      path: "#{baseurl}#{current_note.url}#{link_extension}",
      label: current_note.data['title'],
    } unless current_note.path.include?('_notes/index.html')
  end

  def update_backlinks(current_note, notes_linking_to_current_note)
    current_note.data['backlinks'] = notes_linking_to_current_note
  end

  def add_graph_edges(graph_edges, notes_linking_to_current_note, current_note)
    notes_linking_to_current_note.each do |n|
      graph_edges << {
        source: note_id_from_note(n),
        target: note_id_from_note(current_note),
      }
    end
  end

  def write_graph_to_file(graph_nodes, graph_edges)
    File.write('_includes/notes_graph.json', JSON.dump({
      edges: graph_edges,
      nodes: graph_nodes,
    }))
  end

  def note_id_from_note(note)
    note.data['title'].bytes.join
  end
end
