require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    context "出品が成功する場合" do

      it "item_nameとitem_text、categoryとstatus、delivery_feeとarea、dayとpriceが存在すれば出品できる" do
        expect(@item).to be_valid
      end  

      it "item_nameが40文字以下の時出品できる" do
        @item.item_name = "aaaaa"
        expect(@item).to be_valid
      end

      it "item_textが1000文字以内なら出品できる" do
        @item.item_text = "aaaaaaa"
        expect(@item).to be_valid
      end

      it "priceが300~99999999円以内なら出品できる" do
        @item.price = "10000"
        expect(@item).to be_valid
      end
    end

    context "出品が成功しない場合" do
      it "画像は1枚必須であること(ActiveStorageを使用すること)" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")

      end
      it "商品名が必須であること" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "商品の説明が必須であること" do
        @item.item_text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end
      it "カテゴリーの情報が必須であること" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態についての情報が必須であること" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "配送料の負担についての情報が必須であること" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "発送元の地域についての情報が必須であること" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it "発送までの日数についての情報が必須であること" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end
      it "価格についての情報が必須であること" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300~99999999円以内であること" do
        @item.price = "100"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
    end
  end
end