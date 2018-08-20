class GoodReadsBooks::Scraper
  #
  def self.scrape_search_results(search_results_url)
    search_results_array = []

    html = open(search_results_url)
    doc = Nokogiri::HTML(html)

    search_results_array
  end
end
