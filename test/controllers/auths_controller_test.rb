require 'test_helper'

class AuthsControllerTest < ActionDispatch::IntegrationTest
  test "ログイン画面呼び出し" do
    get new_auths_url
    assert_response :success
  end
  test "ログイン処理" do
    post auths_url, params: {auth: { email: "taro@sample.com", password: "tarotaro123" }}
    assert_response :redirect
  end
  test "ログイン失敗処理" do
    post auths_url, params: {auth: { email: "taro@sample.com", password: "taro123" }}
    assert_response :redirect
  end
  test "ログアウト処理" do
    delete auths_url
    assert_equal nil,session[:user_id]
  end

end
