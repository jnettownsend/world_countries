require "pry"
require "open-uri"
require "nokogiri"
require 'json'

class Scraper
    SCRAPE_URL="https://www.scrapethissite.com/pages/simple/"

    def self.scrape_and_print_countries(name)
        puts "Fetching countries..."
        doc = Nokogiri::HTML(URI.open("https://www.scrapethissite.com/pages/simple/"))
        country_name = (doc.css(".country-name").text)
        country_capital = (doc.css(".country-capital").text)
        country_population = (doc.css(".country-population").text)
        country_area = (doc.css(".country-area").text)

        Country.new(country_name, country_capital, country_population, country_area)

        binding.pry
        scraped_countries.each do |country|
            puts "| #{country["name"]} | #{country["capital"]} | #{country["population"]} | #{country["area"]} "
        end
    end
end

