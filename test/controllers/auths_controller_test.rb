require 'test_helper'

class AuthsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get auths_new_url
    assert_response :success
  end

  test "should get create" do
    get auths_create_url
    assert_response :success
  end

  test "should get destroy" do
    get auths_destroy_url
    assert_response :success
  end

end
