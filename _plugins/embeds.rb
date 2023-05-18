class EmbedUrlGenerator < Jekyll::Generator
  def generate(site)
    all_notes = site.collections['notes'].docs
    all_pages = site.pages

    all_docs = all_notes + all_pages

    all_docs.each do |current_note|
      current_note.content.gsub!(/(https?:\/\/www\.youtube\.com\/watch\?v=[^\s]+)/) do |match|
        "<iframe width='560' height='315' src='https://www.youtube.com/embed/#{$1.split('=').last}' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>"
      end

      current_note.content.gsub!(/(https?:\/\/\S+\.(png|jpg|jpeg|gif|bmp))/) do |match|
        "![Image](#{$1})"
      end
    end
  end
end
