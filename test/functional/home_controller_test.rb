require 'test_helper'
require "mocha"

class HomeControllerTest < ActionController::TestCase
  def setup
     mock_all_http_responses
   end
   
  test "the truth" do
      get :index
  end
  
end
