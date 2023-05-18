# frozen_string_literal: true
class EmbedGenerator < Jekyll::Generator
  def generate(site)
    all_notes = site.collections['notes'].docs
    all_pages = site.pages
    all_docs = all_notes + all_pages

    all_docs.each do |current_note|
      # Embed tweets
      current_note.content.gsub!(
        /^https?:\/\/twitter\.com\/(?:#!\/)?(\w+)\/status(es)?\/(\d+)$/i,
        <<~HTML
          <blockquote class="twitter-tweet">
           This tweet could not be embedded. <a href="#{'\0'}">View it on Twitter instead.</a>
          </blockquote>
          <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
        HTML
      )

      # Embed YouTube videos
      current_note.content.gsub!(
        /(?:http?s?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:v\/|(?:embed\/)?(?:watch\?v=)?|.*\/)|(?:youtu\.be\/))([^?\&\#]+)/,
        '<iframe width="560" height="315" src="https://www.youtube.com/embed/\1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
      )

      # Embed Vimeo videos
      current_note.content.gsub!(
        /(?:http?s?:\/\/)?(?:www\.)?(?:vimeo\.com\/)([0-9]+)/,
        '<iframe src="https://player.vimeo.com/video/\1" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'
      )

    end
  end
end
