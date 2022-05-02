require 'test_helper'

class LoginControleTest < ActionDispatch::IntegrationTest
  setup do
    # テスト用アップロード画像
    # ログイン処理（特権ユーザー）
  end
  test "トップページの接続" do
  end
  test "会議室一覧の接続" do
  end
  test "会議室登録の接続" do
  end
  test "会議室編集の接続" do
  end
  test "会議室削除の接続" do
  end
  test "予約登録の接続" do
  end
  test "予約取り消しの接続（ログインユーザーと同じ）" do
    # ログインユーザーと等しい予約取り消し
    # 削除後の予約一覧画面確認（ヘッダー行1つ予約行が2つある）
  end
  test "予約取り消しの接続（ログインユーザーと異なる）" do
    # ログインユーザーと等しい予約取り消し
    # ログインユーザーと異なる場合、多少リソースなしの例外エラーになる
    # 削除後の予約一覧画面確認（ヘッダー行1つ予約行が3つある）
  end
end
