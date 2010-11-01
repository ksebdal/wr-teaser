require 'curb'
require 'nokogiri'

class HomeController < ApplicationController

  def index
    single_table = single_wrs()
    millis = calculate_total(single_table)
    @total = format_millis(millis)
  end

  def format_millis(millis)
    minutes = (millis/60000).to_i
    seconds = ((millis-minutes*60000)/1000).to_i
    houndreds = ((millis-minutes*60000-seconds*1000)/10).to_i
    "#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')},#{houndreds.to_s.rjust(2, '0')}"
  end

  def calculate_total(table)
    total = 0
    table.each do |key, value|
      if value.time =~ /([0-9]*)\:*([0-9][0-9]),([0-9][0-9])/
        millis = ($3.to_i*10) + ($2.to_i*1000) + ($1.to_i*60*1000)
        total = total + millis
      end
    end
    total
  end

end
