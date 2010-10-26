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
      elsif element % 3 == 1
        time = wrs.text
      elsif element % 3 == 2
        name = wrs.text
        wrs_table[level.slice(0..1)] = [name,time]
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
      times = doc.xpath('//td[@class = "list"][@width = 100]')
      puts times[1].text
      names_and_teams = doc.xpath('//td[@class = "list"]//a')
      puts "list"
      puts names_and_teams[1].text
      #puts names_and_teams.size
      #puts names_and_teams.to_s
      if (names_and_teams[1].text =~ /\[.?\]/)
        puts "ok"
      end
      #<a href="http://elmaonline.moposite.com/?s=players&amp;t=EPO">[EPO]</a>
      wrs_table
  end

end
