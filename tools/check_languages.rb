# frozen_string_literal: true

# Run after jekyll build: bundle3.2 exec ruby tools/check_languages.rb _site
require "json"
require "nokogiri"
require "uri"

root = ARGV.fetch(0, "_site")
base = ARGV.fetch(1, "")
pages = {}
errors = []
Dir.glob(File.join(root, "**", "*.html")).each do |file|
  document = Nokogiri::HTML(File.read(file))
  switches = document.css("[data-language-switch]")
  next if switches.empty? # Redirect pages have no interface.

  language = document.at_css("html")["lang"]
  options = switches.to_h { |a| [a["lang"], a["href"]] }
  current = options[language]
  errors << "#{file}: incomplete language switch" unless options.keys.sort == ["en", "zh-CN"]
  errors << "#{file}: incorrect switch selection" unless switches.select { |a| a["aria-current"] == "true" }.map { |a| a["lang"] } == [language]
  pages[current] = [file, document, language, options]
end

pages.each do |url, (file, document, language, options)|
  options.each do |target_language, target|
    other = pages[target]
    errors << "#{file}: missing counterpart #{target}" unless other && other[2] == target_language && other[3] == options
  end
  document.css("a[href]:not([data-language-switch])").each do |a|
    target = URI::DEFAULT_PARSER.unescape(a["href"].split(/[?#]/).first.to_s)
    other = pages[target]
    errors << "#{file}: link resets language: #{a['href']}" if other && other[2] != language
  end
  expected_search = "#{base}#{language == 'en' ? '/en' : ''}/assets/js/data/search.json"
  errors << "#{file}: wrong search index" unless document.to_html.include?("json: '#{expected_search}'")
  if url.include?("/posts/")
    errors << "#{file}: self recommended as related note" if document.css("#related-posts a[href]").any? { |a| a["href"] == url }
    counterpart = pages[options[language == "en" ? "zh-CN" : "en"]]
    if counterpart
      original_content = counterpart[1].at_css(".post-content")
      translated_content = document.at_css(".post-content")
      errors << "#{file}: note content changed during language switching" unless original_content && translated_content && original_content.text == translated_content.text
      errors << "#{file}: math renderer differs between languages" unless document.css("#MathJax-script").size == counterpart[1].css("#MathJax-script").size
    end
  end
end

%w[en zh-CN].each do |language|
  prefix = language == "en" ? "/en" : ""
  %W[#{base}#{prefix}/ #{base}#{prefix}/notes/ #{base}#{prefix}/notes/page2/ #{base}#{prefix}/404.html].each do |url|
    errors << "Missing essential page #{url}" unless pages.key?(url)
  end
  search = JSON.parse(File.read(File.join(root, prefix, "assets/js/data/search.json")))
  search.each do |result|
    target = pages[result.fetch("url")]
    errors << "Search result has incorrect language: #{result['url']}" unless target && target[2] == language
  end
end

abort errors.join("\n") unless errors.empty?
puts "Language checks passed for #{pages.size} pages: switches, internal links, pagination, related notes and search."
