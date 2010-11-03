require 'curb'
require 'nokogiri'

class HomeController < ApplicationController

  def index
    single_table = single_wrs()
    @singles_total = calculate_total_in_milliseconds(single_table)
  end

  def calculate_total_in_milliseconds(wr_table)
    total_in_milliseconds = 0
    wr_table.each do |wr|
      if wr.time =~ /([0-9]*)\:*([0-9][0-9]),([0-9][0-9])/
        milliseconds = ($3.to_i*10) + ($2.to_i*1000) + ($1.to_i*60*1000)
        total_in_milliseconds = total_in_milliseconds + milliseconds
      end
    end
    total_in_milliseconds
  end

end
