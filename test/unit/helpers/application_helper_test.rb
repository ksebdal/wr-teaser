require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test "negative valus should not format" do
    assert_equal "", format_milliseconds_to_time(-1)
  end

  test "0-10 milliseconds should format" do
    assert_equal "00:00", format_milliseconds_to_time(0)
    assert_equal "00:00", format_milliseconds_to_time(10-1)
  end

  test "positive values less then one seconds should format" do
    assert_equal "00:01", format_milliseconds_to_time(10)
    assert_equal "00:99", format_milliseconds_to_time(100-1)
  end
  
  test "positive values less then one minute should format" do
    assert_equal "01:00", format_milliseconds_to_time(1000)
    assert_equal "01:00", format_milliseconds_to_time(1009)
    assert_equal "59:99", format_milliseconds_to_time(59999)
  end

  test "positive values less then one hour should format" do
    assert_equal "01:00:00", format_milliseconds_to_time(60000)
    assert_equal "59:59:99", format_milliseconds_to_time(60000*59+59999)
  end
  
  test "positive values more then one hour should format" do
    assert_equal "1:00:00:00", format_milliseconds_to_time(60000*60)
    assert_equal "10:00:00:01", format_milliseconds_to_time(60000*60*10+10)
  end
end
