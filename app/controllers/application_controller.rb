# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def single_wrs
    response = Curl::Easy.perform('http://www.moposite.com/records_elma_wrs.php')
    doc = Nokogiri::HTML(response.body_str)
    wrs_table = Hash.new
    name = ''
    level = ''
    time = ''
    element = 0
    doc.xpath('//tr//td[@class = "wr"]|//tr//td[@class = "wrnew"]').each do |wrs|
      if element % 3 == 0
        level = wrs.text
        #        puts level.slice(3..-1)
      elsif element % 3 == 1
        time = wrs.text
      elsif element % 3 == 2
        name = wrs.text
        wrs_table[level.slice(0..1)] = {name,time}
      else
        #throw fail
      end 
      element += 1
    end
    wrs_table
  end
  
  def eol_single_wrs
      response = Curl::Easy.perform('http://elmaonline.moposite.com/?s=stats&p=internal')
      doc = Nokogiri::HTML(response.body_str)
      wrs_table = Hash.new
      name = ''
      team = ''
      level = ''
      time = ''
      element = 0
      allset = 0
      #doc.xpath('//td[@class = "list"][@width = 100]|//td[@class = "list"][@width = 22]|//td[@class = "list"]//a').each do |wrs|
      doc.xpath('//td[@class = "list"][@width = 100]|//td[@class = "list"][@width = 22]|//td[@class = "list"]//a').each do |wrs|
        if element % 4 == 0
          level = wrs.text
          allset += 1
          #        puts level.slice(3..-1)
        elsif element % 4 == 1
          name = wrs.text
          allset += 1
        elsif element % 4 == 2
          team = wrs.text
        elsif element % 4 == 3
          time = wrs.text
          allset += 1
        else
          #throw fail
        end 
        if allset == 3
          allset = 0
          puts level.slice(0..1)
          puts name
          puts team
          puts time
          wrs_table[level.slice(0..1)] = {name + " " + team,time}
        end  
        element += 1
        puts wrs
      end
      wrs_table
  end

end
