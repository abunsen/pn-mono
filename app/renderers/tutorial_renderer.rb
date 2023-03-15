require 'securerandom'

class TutorialRenderer < Redcarpet::Render::HTML
  # include Redcarpet::Render::SmartyPants

  def hrule
    '<hr class="bg-ninja-red border-ninja-red">'
  end

  def block_html(raw)
    raw.gsub(/\<iframe width="\d+"/, '<iframe width="100%" class="my-3"')
  end

  def header(text, level)
    case level
    when 1
      "<h1 class=\"text-3xl font-semibold mt-4 mb-2\">#{text}</h1>"
    when 2
      "<h2 class=\"text-xl font-semibold mt-4\">#{text}</h2>"
    when 3
      "<h3 class=\"text-lg font-semibold mt-4\">#{text}</h3>"
    end
  end

  def image(link, title, alt_text)
    "<img src=\"#{link}\" class=\"inline-block rounded rounded-lg w-full\" alt=\"#{alt_text}\" title=\"#{title}\"/>"
  end

  def list(contents, list_type)
    if list_type == :ordered
      "<ol class=\"list-decimal ml-4 font-light leading-tight\">#{contents}</ol>"
    else
      contents
    end
  end

  def list_item(text, list_type)
    "<li class=\"my-1\">#{text}</li>"
  end

  def link(link, title, content)
    "<a href=\"#{link}\" title=\"#{title}\" class=\"underline font-semibold\" target=\"_blank\">#{content}</a>"
  end

  def paragraph(text)
    "<p class=\"my-4 font-light leading-tight\">#{text}</p>"
  end

  def block_code(code, lang)
    "<div class=\"font-code text-xs bg-code-gray p-3 rounded rounded-lg\"><code data-tut-lang=\"#{lang}\" id=\"#{lang}-#{SecureRandom.hex}\">#{code}</code></div>"
  end
end