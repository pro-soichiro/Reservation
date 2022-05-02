require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Userバリデーション空属性検証" do
    user = User.create(name: "", email: "", password: "")
    assert_empty user.email
    assert_empty user.password
    assert_empty user.name
    assert_equal 3, user.errors.count
  end
  test "Loginバリデーション空属性検証" do
    auth = Auth.new(email: "", password: "")
    auth.valid?
    assert_empty auth.email
    assert_empty auth.password
    assert_equal 2, auth.errors.count
  end
  test "User登録・更新・削除検証" do
    # 登録
    assert_difference "User.count",  1 do
      User.create(name: "山口ひろゆき", email: "hiro@testabc.co.jp", password: "password#test")
    end
    # 削除
    assert_difference "User.count", -1 do
      users(:one).destroy
    end
    # 更新
    assert_changes "users(:two).email",from: "hanako@sample.com", to: "hana@sample.com" do
      users(:two).update(email: "hana@sample.com")
    end

  end
end
