require 'test_helper'

class LoginControleTest < ActionDispatch::IntegrationTest
  setup do
    # テスト用アップロード画像
    uploard_file = Rack::Test::UploadedFile.new(Rails.root.join("test/fixtures/files/room1.jpg"))
    @room_images = [uploard_file]
    # ログイン処理（特権ユーザー）
    post auths_url, params: { auth: {email: "taro@sample.com", password: "tarotaro123"}}
  end

  test "トップページの接続" do
    get root_url(locale: "ja")
    assert_select 'h1',"Topページ"
    assert_response :success
  end

  test "会議室一覧の接続" do
    get rooms_url(locale: "ja")
    assert_select 'h1',"会議室一覧"
    assert_response :success
  end

  test "会議室登録の接続" do
    # 会議室登録画面の呼び出し評価
    get new_room_url(locale: "ja")
    assert_response :success
    assert_select 'h1',"会議室 登録"

    # 会議室登録処理の評価
    assert_difference("Room.count") do
      post rooms_url,
        params: { room: { name: "テスト部屋#00", place: "東京", number: 10, images: @room_images }}
    end
    assert_response :redirect
  end

  test "会議室編集の接続" do
    # 会議室編集画面の呼び出し評価
    get edit_room_url(rooms(:two), locale: "ja")
    assert_response :success

    # 会議室更新処理の評価
    patch room_url(rooms(:two), locale: "ja"),
      params: {room: {name: "テスト#99", place: "大阪", number: 20, images: @room_images } }
    assert_equal flash[:notice],
      I18n.t("message.update_complete", model: Room.model_name.human)
  end

  test "会議室削除の接続" do
    assert_difference "Room.count", -1 do
      delete room_url(rooms(:one), locale: "ja")
    end
    assert_equal flash[:notice],
      I18n.t("message.delete_complete", model: Room.model_name.human)
    assert_response :redirect
  end

  test "予約登録の接続" do
    get new_room_entry_url(rooms(:one), locale: "ja")
    assert_response :success
  end

  test "予約取り消しの接続（ログインユーザーと同じ）" do
    # ログインユーザーと等しい予約取り消し
    entry = entries(:one)
    room = entry.room

    assert_difference "Entry.count", -1 do
      delete entry_url(entry, locale: "ja"), xhr: true
    end
    assert_response :success


    # 削除後の予約一覧画面確認（ヘッダー行1つ予約行が2つある）
    get room_url(room, locale: "ja")
    assert_select "tr", 3
  end

  test "予約取り消しの接続（ログインユーザーと異なる）" do
    # ログインユーザー(users(:one))と異なる予約取り消し
    entry = entries(:two)
    room = entry.room

    # ログインユーザーと異なる場合、多少リソースなしの例外エラーになる
    assert_raises ActiveRecord::RecordNotFound do
      delete entry_url(entry, locale: "ja"), xhr: true
    end

    # 削除後の予約一覧画面確認（ヘッダー行1つ予約行が3つある）
    get room_url(room, locale: "ja")
    assert_select "tr", 4
  end

end
