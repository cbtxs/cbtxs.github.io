# frozen_string_literal: true

require "cgi"
require "nokogiri"

module TableOfContentsFilter
  def table_of_contents(html)
    root = { level: 0, children: [] }
    stack = [root]
    Nokogiri::HTML.fragment(html.to_s).css("h2, h3, h4, h5, h6").each do |heading|
      next if heading["id"].to_s.empty? || heading["data-toc-skip"]

      heading.css(".anchor").remove
      item = { level: heading.name[1].to_i, id: heading["id"],
               title: heading["data-toc-text"] || heading.text.strip, children: [] }
      stack.pop while stack.last[:level] >= item[:level]
      stack.last[:children] << item
      stack << item
    end
    render_toc_items(root[:children])
  end

  private

  def render_toc_items(items)
    return "" if items.empty?

    links = items.map do |item|
      id = CGI.escapeHTML(item[:id])
      title = CGI.escapeHTML(item[:title])
      %(<li class="nav-item"><a class="nav-link" href="##{id}">#{title}</a>#{render_toc_items(item[:children])}</li>)
    end
    %(<ul class="nav flex-column">#{links.join}</ul>)
  end
end

Liquid::Template.register_filter(TableOfContentsFilter)
