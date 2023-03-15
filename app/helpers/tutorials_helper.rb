module TutorialsHelper
  def render_tut(content)
    content = render_title(content)
    markdown = Redcarpet::Markdown.new(TutorialRenderer, autolink: true, tables: true, fenced_code_blocks: true)
    markdown.render(content)
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
end
