module ScrapeDomain
  require 'nokogiri'
  require 'open-uri'
  require 'json'

  def self.scrape_tags_from_domain domain:, tags:
    page = Nokogiri::HTML(open(domain))
    json_data = {}
    tags.each do |tag|
      if tag == "a"
        json_data["links"] = page.css(tag).map { |t|t["href"] }
      else
        json_data[tag] = page.css(tag).map { |t| t.text.gsub("\n", '') }
      end
    end
    JSON.pretty_generate json_data
  end
end
