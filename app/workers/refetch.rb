require 'resque/plugins/resque_heroku_autoscaler'

class Refetch 
  
  require 'rubygems'  
  require 'nokogiri'  
  require 'open-uri'

  extend Resque::Plugins::HerokuAutoscaler

  @queue = :fetchdata_queue 
  def self.perform  # Fetching all the details from the look show page including image
    @looks = Look.published.all  
    
    @looks.each do |look|
      url = "http://www.lookatme.ru/looks/" + look.lookatmeid.to_s + "/"
    
      doc = Nokogiri::HTML(open(url))  
     
      #look.name = doc.at_css(".b-article-title-look").text
      #look.dateadded = doc.at_css(".time").text
      #look.dateadded << ' ' + doc.at_css(".about , .time").text.split.last # puting togeather the date when the look was added with the year
      #look.source_img_url = doc.at_css("#j-look_image")[:src].to_s
      look.fetch_image  #  fetch image from remote url with carrierwave
      # look.processing = false    
      look.save 
    end 
  end 
end