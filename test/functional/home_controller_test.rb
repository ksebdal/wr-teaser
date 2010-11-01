require 'test_helper'
require "mocha"

class HomeControllerTest < ActionController::TestCase
  def setup
     mock_all_http_responses
  end

  test "the truth" do
      get :index
      assert_response :success
      #assert_equal "text/html; charset=ISO-8859-1", @controller.headers["Content-Type"]
  end

end
