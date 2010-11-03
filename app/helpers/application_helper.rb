# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_milliseconds_to_time(milliseconds)
    ret = ""
    if milliseconds >= 0
      hours = (milliseconds/(60000*60)).to_i
      minutes = ((milliseconds-hours*60*60000)/60000).to_i
      seconds = ((milliseconds-hours*60*60000-minutes*60000)/1000).to_i
      houndreds = ((milliseconds-hours*60*60000-minutes*60000-seconds*1000)/10).to_i
      if hours > 0
        ret += "#{hours.to_s}:"
      end
      if (minutes > 0 || hours > 0)
        ret += "#{minutes.to_s.rjust(2, '0')}:"
      end
      ret += "#{seconds.to_s.rjust(2, '0')}:#{houndreds.to_s.rjust(2, '0')}"
    end
    ret
  end
end
