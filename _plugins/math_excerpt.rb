# frozen_string_literal: true

require "cgi"

module MathExcerptFilter
  # Keep complete TeX expressions when shortening rendered article text.
  MATH = /(?<!\\)(?:\\\[.*?\\\]|\\\(.*?\\\)|\$\$.*?(?<!\\)\$\$|\$(?!\$).*?(?<!\\)\$)/m

  def math_excerpt(input, length = 200)
    text = CGI.unescapeHTML(input.to_s).gsub(/\s+/, " ").strip
    limit = [length.to_i, 3].max
    return text if text.length <= limit

    cutoff = limit - 3
    text.to_enum(:scan, MATH).each do
      match = Regexp.last_match
      if match.begin(0) < cutoff && match.end(0) > cutoff
        # Include a leading formula intact; otherwise stop before it.
        cutoff = match.begin(0).zero? ? match.end(0) : match.begin(0)
        break
      end
    end
    text[0...cutoff].rstrip + "..."
  end
end

Liquid::Template.register_filter(MathExcerptFilter)
