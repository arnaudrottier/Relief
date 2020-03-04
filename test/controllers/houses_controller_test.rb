require 'test_helper'

class HousesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get houses_show_url
    assert_response :success
  end

end
