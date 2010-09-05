require 'curb'
require 'nokogiri'

class HomeController < ApplicationController

  def index    
    response = Curl::Easy.perform('http://www.moposite.com/records_elma_wrs.php')
    doc = Nokogiri::HTML(response.body_str)
    name = ''
    level = ''
    time = ''
    element = 0
    doc.xpath('//tr//td[@class = "wr"]|//tr//td[@class = "wrnew"]').each do |wrs|
      if element % 3 == 0
        level = wrs.text
        puts level
      end 
      if element % 3 == 1
        time = wrs.text
        puts time
      end 
      if element % 3 == 2
        name = wrs.text
        puts name
      end 
      element += 1
    end
  end
end
