module TutorialsHelper
  def render_tut(content)
    content = render_title(content)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    render_headers(render_hr(markdown.render(content)))
  end

  def extract_section_titles(content)
    content.scan(/##[\s|\w]+\n$/).map { |title| title.gsub('##', '') }
  end

  def render_title(content)
    title = content.first
    title.gsub!('title:', '')
    content[0] = "# #{title}\n ---\n"
    content.join
  end

  def render_headers(content)
    copy = content.dup
    copy.gsub!('<h1>', '<h1 class="text-3xl font-semibold mt-4 mb-2">')
    copy.gsub!('<h2>', '<h2 class="text-xl font-semibold mt-4">')
    copy.gsub!('<h3>', '<h3 class="text-lg font-semibold mt-4">')
    copy
  end

  def render_hr(content)
    content.gsub('<hr>', '<hr class="bg-ninja-red border-ninja-red">')
  end
end
