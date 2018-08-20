class GoodReadsBooks::Scraper

  def self.scrape_search_results(search_results_url)
    search_results_array = []

    html = open(search_results_url)
    doc = Nokogiri::HTML(html)

    return search_results_array
  end

  def self.scrape_book_profile_page(profile_url)
    books_profile_hash = {}

    html = open(profile_url)
    doc = Nokogiri::HTML(html)

    return books_profile_hash 
end
