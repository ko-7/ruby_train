require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael) #~/fixtures/users.ymlからmichaelの情報をとってくる
  end

  # 【このテストの流れ】
  # １．ログイン用のパスを開く
  # ２．新しいセッションのフォームが正しく表示 されたことを確認する
  # ３．わざと無効なparamsハッシュを使ってセッション用パスにPOSTする
  # ４．新しいセッションのフォームが再度表示され、フラッシュメッセージが追加されることを確認する
  # ５．別のページ（Homeページなど） にいったん移動する
  # ６．移動先のページでフラッシュメッセージが表示されていないことを確認する
  test "login with valid email/invalid password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {
      session: {
        email:    @user.email,
        password: "invalid"
      }
    }
    assert_not is_logged_in?
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  # 【テストの流れ】
  # １．ログイン用のパスを開く
  # ２．セッション用パスに有効な情報をpostする
  # ３．ログイン用リンクが表示されなくなったことを確認する
  # ４．ログアウト用リンクが表示されていることを確認する
  # ５．プロフィール用リンクが表示されていることを確認する
  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: {
      session: {
        email:    @user.email,
        password: 'password'
      }
    }
    assert is_logged_in?
    assert_redirected_to @user  #リダイレクト先がuser_path(@user)になっているかチェック
    follow_redirect!            #実際にリダイレクト実行
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,       count: 0
    assert_select "a[href=?]", user_path(@user),  count: 0
  end

end

