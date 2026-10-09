# frozen_string_literal: true

require "uri"
require "nokogiri"

module SiteLanguages
  def self.path_key(path)
    URI::DEFAULT_PARSER.unescape(path.to_s)
  end

  def self.route(site, url, language)
    uri = URI.parse(url.to_s)
    return url if uri.host || uri.scheme || !uri.path.start_with?("/")

    base = site.baseurl.to_s
    path = uri.path
    path = path.delete_prefix(base) unless base.empty?
    pair = site.data.fetch("language_routes", {})[path_key(path)]
    return url unless pair

    uri.path = base + pair.fetch(language == "en" ? "en" : "zh-CN")
    uri.to_s
  rescue URI::InvalidURIError
    # Chinese tag/category names may be unescaped in template output.
    path, suffix = url.to_s.split(/(?=[?#])/, 2)
    pair = site.data.fetch("language_routes", {})[path_key(path.delete_prefix(site.baseurl.to_s))]
    pair ? site.baseurl.to_s + pair.fetch(language == "en" ? "en" : "zh-CN") + suffix.to_s : url
  end

  module Filters
    def localized_url(url, language = nil)
      site = @context.registers[:site]
      language ||= @context["page"]["lang"]
      SiteLanguages.route(site, url, language)
    end
  end

  def self.mirror(site, source, url)
    # Each copy needs its own template path: Jekyll caches Liquid by path.
    # Sharing index.html here would render the profile in notes/search pages.
    path = url.delete_prefix("/")
    directory = url.end_with?("/") ? path : File.dirname(path)
    name = url.end_with?("/") ? "index#{source.ext}" : File.basename(path)
    copy = Jekyll::PageWithoutAFile.new(site, site.source, directory, name)
    copy.content = source.content.dup
    copy.data = source.data.dup
    copy.data.delete("redirect_from")
    copy.data.merge!("lang" => "en", "permalink" => url, "language_path" => source.url)
    if source.is_a?(Jekyll::Document)
      copy.data.merge!("date" => source.date, "previous" => source.previous_doc, "next" => source.next_doc)
    elsif source.respond_to?(:pager)
      copy.pager = source.pager
    end
    copy.data["title"] = "Study Notes" if source.data["layout"] == "home"
    if source.url == "/404.html"
      copy.data["title"] = "404: Page not found"
    end
    copy
  end

  def self.prepare(site)
    routes = {}
    originals = site.pages.select do |p|
      !p.url.start_with?("/en/") &&
        (p.data["layout"] && p.url.end_with?("/", ".html") || p.url == "/assets/js/data/search.json")
    end
    sources = originals + site.posts.docs
    existing = site.pages.map(&:url)
    sources.each do |source|
      zh_url = source.url
      en_url = "/en#{zh_url}"
      pair = { "zh-CN" => zh_url, "en" => en_url }
      routes[path_key(zh_url)] = pair
      routes[path_key(en_url)] = pair
      source.data["lang"] = "zh-CN"
      source.data["language_path"] = zh_url
      source.data["title"] = "学习笔记" if source.data["layout"] == "home"
      source.data["title"] = "404：页面未找到" if zh_url == "/404.html"
      site.pages << mirror(site, source, en_url) unless existing.include?(en_url)
    end
    site.pages.each do |p|
      pair = routes[path_key(p.url)]
      p.data["language_urls"] = pair if pair
    end
    site.posts.docs.each { |p| p.data["language_urls"] = routes[path_key(p.url)] }
    site.data["language_routes"] = routes
  end

  def self.rewrite_links(item)
    return unless item.data["language_urls"] && item.output.to_s.include?("<html")

    site = item.site
    document = Nokogiri::HTML(item.output)
    document.css("a[href]").each do |a|
      next if a["data-language-switch"]

      a["href"] = route(site, a["href"], item.data["lang"])
    end
    item.output = document.to_html
  end
end

Liquid::Template.register_filter(SiteLanguages::Filters)
Jekyll::Hooks.register :site, :pre_render do |site, _payload|
  SiteLanguages.prepare(site)
end
Jekyll::Hooks.register [:pages, :documents], :post_render do |item|
  SiteLanguages.rewrite_links(item)
end
