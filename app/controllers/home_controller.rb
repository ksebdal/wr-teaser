require 'curb'
require 'nokogiri'

class HomeController < ApplicationController

  def index
    single_table = single_wrs()
    milliseconds = calculate_total_in_milliseconds(single_table)
    @total_str = format_milliseconds(milliseconds)
  end

  def format_milliseconds(milliseconds)
    minutes = (milliseconds/60000).to_i
    seconds = ((milliseconds-minutes*60000)/1000).to_i
    houndreds = ((milliseconds-minutes*60000-seconds*1000)/10).to_i
    "#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')},#{houndreds.to_s.rjust(2, '0')}"
  end

  def calculate_total_in_milliseconds(table)
    total = 0
    table.each do |wr|
      if wr.time =~ /([0-9]*)\:*([0-9][0-9]),([0-9][0-9])/
        milliseconds = ($3.to_i*10) + ($2.to_i*1000) + ($1.to_i*60*1000)
        total += milliseconds
      end
    end
    total
  end

end
