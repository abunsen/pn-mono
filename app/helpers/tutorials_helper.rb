module TutorialsHelper
  def render_tut(content)
    content = render_title(content)
    content = render_author(content).join
    markdown = Redcarpet::Markdown.new(
      TutorialRenderer,
      autolink: true,
      tables: true,
      fenced_code_blocks: true
    )
    markdown.render(content)
  end

  def extract_section_titles(content)
    content.scan(/##[\s|\w]+\n$/).map { |title| title.gsub('##', '') }
  end

  def render_title(content)
    title = content.first
    title.gsub!('title:', '')
    content[0] = "# #{title}\n ---\n"
    content
  end

  def render_author(content)
    author = content[1]
    author.gsub!('author: @', '')
    begin
      content[1] = render partial: "tutorials/partials/authors/#{author.strip}", locals: { author: author }
    rescue
      author = "andres"
      content[1] = render partial: "tutorials/partials/authors/#{author}", locals: { author: author }
    end
    content
  end
end
