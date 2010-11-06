require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test "negative valus should not format" do
    assert_equal "", format_milliseconds_to_time(-1)
    assert_equal "", format_milliseconds_to_time(-HOUNDRED)
    assert_equal "", format_milliseconds_to_time(-SECOND)
    assert_equal "", format_milliseconds_to_time(-MINUTE)
    assert_equal "", format_milliseconds_to_time(-HOUR)
  end

  test "positive values less then one houndred should format" do
    assert_equal "00:00", format_milliseconds_to_time(0)
    assert_equal "00:00", format_milliseconds_to_time(HOUNDRED-5)
  end

  test "positive values less then one seconds should format" do
    assert_equal "00:01", format_milliseconds_to_time(HOUNDRED)
    assert_equal "00:99", format_milliseconds_to_time(SECOND-HOUNDRED)
  end
  
  test "positive values less then one minute should format" do
    assert_equal "01:00", format_milliseconds_to_time(SECOND)
    assert_equal "59:99", format_milliseconds_to_time(MINUTE-HOUNDRED)
  end

  test "positive values less then one hour should format" do
    assert_equal "01:00:00", format_milliseconds_to_time(MINUTE)
    assert_equal "59:59:99", format_milliseconds_to_time(HOUR-HOUNDRED)
  end
  
  test "positive values more then one hour should format" do
    assert_equal "1:00:00:00", format_milliseconds_to_time(HOUR)
    assert_equal "10:00:00:01", format_milliseconds_to_time(HOUR*10+HOUNDRED)
  end
  
  test "thousands should not impact result" do
    assert_equal "00:00", format_milliseconds_to_time(HOUNDRED-1)
    assert_equal "01:00", format_milliseconds_to_time(SECOND+9)
  end
end
