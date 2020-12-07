require 'rails_helper'
RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in name="user[username]", with: @user.username
      fill_in name="user[email]", with: @user.email
      fill_in name="user[password]", with: @user.password
      fill_in name="user[password_confirmation]", with: @user.password_confirmation
      expect do
         click_button "Sign up"
        end.to change(User, :count).by(1)
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in name="user[username]", with: ""
      fill_in name="user[email]", with: ""
      fill_in name="user[password]", with: ""
      fill_in name="user[password_confirmation]", with: ""
      expect do
          click_button "Sign up"
        end.to change(User, :count).by(0)
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      visit root_path
      expect(page).to have_content("ログイン")
      visit new_user_session_path
      fill_in name="user[email]", with: @user.email
      fill_in name="user[password]", with: @user.password
      find('input[name="commit"]').click
      click_on("Log in")
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      visit root_path
      expect(page).to have_content("ログイン")
      visit new_user_session_path
      fill_in name="user[email]", with: ""
      fill_in name="user[password]", with: ""
      find('input[name="commit"]').click
      expect(current_path).to eq new_user_session_path
    end
  end
end