class CuratedListScraper < Scraper
  def get_iframes
    @page.search('iframe').map do |iframe|
      iframe.attributes['src'].value
    end
  end
end