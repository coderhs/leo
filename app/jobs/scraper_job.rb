class ScraperJob < ApplicationJob
  queue_as :default

  def perform(website)
    begin
      result = ScrapeDomain.scrape_tags_from_domain domain: website.domain, tags: Website::TAGS
      website.update(status: 'COMPLETED', result: result)
    rescue Exception => e
      website.update(status: 'FAILED', result: JSON.pretty_generate({message: e.message}))
    end
  end
end
