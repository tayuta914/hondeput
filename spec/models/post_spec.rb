require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end
  
  describe 'アウトプット投稿機能' do
    context '投稿がうまくいくとき' do
      it "titleとbody,impressionが存在すれば登録できる" do
        expect(@post).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it 'titleが空だと保存できないこと' do
        @post.title  = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("本のタイトルを入力してください")
      end

      it 'bodyが空だと保存できないこと' do
        @post.body = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("アクションプランを入力してください")
      end

      it 'impressionが空だと保存できないこと' do
        @post.impression = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("感想を入力してください")
      end
    end
  end
end
