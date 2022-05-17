require 'test_helper'

class WellcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wellcome_index_url
    assert_response :success
  end

end
