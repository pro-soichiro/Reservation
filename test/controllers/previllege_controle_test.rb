require 'test_helper'

class PrevillegeControleTest < ActionDispatch::IntegrationTest
  setup do
    # ログイン処理（非特権ユーザー）
  end
  test "トップページの呼び出し" do
  end
  test "会議室一覧の呼び出し(index)" do
  end
  test "会議室登録の呼び出し(new-create)" do
  end
  test "会議室編集の呼び出し(edit-update)" do
  end
  test "会議室削除の呼び出し(destroy)" do
  end
  test "予約登録処理(entry/new-confirm-create)" do
  end
  test "異なるユーザーの予約取り消し処理(entry/destroy)" do
  end
  test "同一ユーザーの予約取り消し処理(entry/destroy)" do
  end
end
