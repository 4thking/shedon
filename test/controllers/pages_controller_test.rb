require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get terms_of_service" do
    get :terms_of_service
    assert_response :success
  end

  test "should get privacy_policy" do
    get :privacy_policy
    assert_response :success
  end

end
