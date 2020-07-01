class DatingAssistant::Scraper

    def self.scrape
     doc = Nokogiri::HTML(open("https://mashable.com/roundup/dating-apps-hater-tinder-grindr-match/"))
     info = doc.css('div.product-roundup-review-card')
     counter = 0
     while counter <= 4
        data = info[counter]
        site = DatingAssistant::Sites.new
        site.name = data.css("h2.product-name").text.strip
        site.description = data.css("div.product-summary").text.strip
        site.url = data.css("div.product-cta a").attribute("href").value
        site.save
        counter += 1
     end
    end



end