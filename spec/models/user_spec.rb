require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "usernameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordは6文字以上であれば登録できる" do
        @user.password = "a00000"
        @user.password_confirmation = "a00000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "usernameが空だと登録できない" do
        @user.username = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ユーザーネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it "emailは一意性でないと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it "emailに＠が含まれていないと登録できない" do
        @user.email = "aaa.aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it "passwordは半角英数字混合がないと登録できない" do
        @user.password = "a11111"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
