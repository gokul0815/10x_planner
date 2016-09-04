require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root_path" do
    get root_path
    assert_response :success
  end

  test "should get home" do
    get home_path
    assert_response :success
  end
end
