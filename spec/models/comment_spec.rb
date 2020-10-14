require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント機能' do

    context "コメントが保存される場合" do

      it "textが5文字以上である" do
        expect(@comment).to be_valid
      end  

    end

    context "コメントが保存されない場合" do
      it "コメントが入力されていない場合" do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end  

      it "コメントが入力されているが5文字以下の場合" do
        @comment.text = "aaaaa"
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text is too short (minimum is 6 characters)")
      end
    end
  end
end
