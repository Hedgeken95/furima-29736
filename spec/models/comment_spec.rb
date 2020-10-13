require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント機能' do

    context "コメントが保存される場合" do

      it "できる" do
        expect(@item).to be_valid
      end  

    end

    context "コメントが保存されない場合" do
      it "できる" do
        expect(@item).to be_valid
      end  
    end
  end
end
