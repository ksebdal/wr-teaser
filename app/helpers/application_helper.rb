# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  HOUNDRED = 10
  SECOND = HOUNDRED*100
  MINUTE = SECOND*60
  HOUR = MINUTE*60
  def format_milliseconds_to_time(milliseconds)
    ret = ""
    if milliseconds >= 0
      hours = (milliseconds/HOUR).to_i
      hours_in_millis = hours*HOUR
      minutes = ((milliseconds-hours_in_millis)/MINUTE).to_i
      minutes_in_millis = minutes*MINUTE
      seconds = ((milliseconds-hours_in_millis-minutes_in_millis)/SECOND).to_i
      seconds_in_millis = seconds*SECOND
      houndreds = ((milliseconds-hours_in_millis-minutes_in_millis-seconds_in_millis)/HOUNDRED).to_i
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
