require 'test_helper'
require "mocha"

class HomeControllerTest < ActionController::TestCase
  def setup
     mock_all_http_responses
  end

  def get_index
    get :index
    assert_response :success
  end
  
  test "title should be set" do
      get_index
      assert_select "title", "wr-stat"
  end
  
  test "total time should be set" do
    get_index
    assert_tag :tag => "p", :attributes => {:class=>"total"}
    assert_equal 2127240, assigns(:single_total) #35:27,55 something
  end
  
end
