class DatingAssistant::CLI


    def selection
        puts "------------------------------------------------------------"
        puts "-------------Welcome to your Dating Assistant.--------------"
        puts "------------------------------------------------------------"
        puts ""
        puts "Here are the best 5 dating sites currently on the market"
        puts""
        scrape
        list
        menu
        goodbye
    end

    def scrape 
        DatingAssistant::Scraper.scrape
    end

    def list 
        @list = DatingAssistant::Sites.all
         @list.each.with_index(1) do |site, index|       
            puts "#{index}. #{site.name.upcase}"
         end
    end

    def menu
        input = ""
        while input != "exit"
         puts ""
         puts "Please enter a choice"
          input = gets.strip.downcase
        if input == "list" 
           list
        elsif input.to_i <= @list.length && input.to_i > 0
           site = DatingAssistant::Sites.all[input.to_i-1]
         puts "Site Name :                      #{site.name}"
         puts "Description :"
         puts "#{site.description.split("\n\n").join("")}"              
         puts "URL : #{site.url}"

        elsif input != "exit"
         puts
         puts "** ERROR **"
         puts "Please enter 1-5 only"
        end
        end
    end

    

   def goodbye
       puts ""
       puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
       puts "  Thank you for using Dating Assistant. Have a great day!"
       puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
   end
    
end