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
    wr_table = Hash.new
    parsed_doc = doc.xpath('//tr//td[@class = "wr"]|//tr//td[@class = "wrnew"]')
    i = 0
    while ( i < (parsed_doc.length))
      # levelnr = {name, time}
      wr_table[parsed_doc[i].text.slice(0..1)] = [parsed_doc[i+2].text,parsed_doc[i+1].text]
      i = i + 3
    end
    wr_table
  end
  
  def eol_single_wrs
      response = Curl::Easy.perform('http://elmaonline.moposite.com/?s=stats&p=internal')
      doc = Nokogiri::HTML(response.body_str)
      wrs_table = Hash.new
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
