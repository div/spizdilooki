class FetchLookIds
  
  require 'rubygems'  
  require 'nokogiri'  
  require 'open-uri'  
  @queue = :fetchid_queue  
  def self.perform   # fetching new look_ids form lookatme.ru along with some details about the look
    
    1.upto(1) do |page|  # loop through look pages on lookatme.ru
      url = "http://www.lookatme.ru/looks/recent" 
      url << '?page=' + page.to_s 
      doc = Nokogiri::HTML(open(url))  
      doc.css(".b-look").each do |item|  # loop through looks on each page 
        #item = doc.css(".b-look")
        id = item.at_css(".name a")[:href].to_s
        id = id.split("/looks/")[1]  
        look = Look.new
        look.lookatmeid = id.to_i  # get the id => get the show_url of each look, so we can fire another job to get data
        look.age = item.at_css(".age").text # age and city are easier to get from index page, then from show page
        look.city = item.at_css(".city").text
        look.save  # fires after_create callback to get data
      end
    end
  end
end