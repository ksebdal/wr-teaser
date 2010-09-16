require 'curb'
require 'nokogiri'

class HomeController < ApplicationController

  def index
  #  single_table = single_wrs
  #  single_table.each {|key, value| puts "#{key} is #{value}" }
    single_table = eol_single_wrs
    #single_table.each {|key, value| puts "#{key} is #{value}" }

  end

  
  
end
