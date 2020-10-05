require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

    describe '商品購入機能' do

      context "購入が成功する場合" do

        it "カードのトークンと、postcode,prefecture_id,city,block,phone_numberが存在すれば購入できる" do
          expect(@order_address).to be_valid
        end 

        it "bildingがなくても購入できる" do
          @order_address.bilding = ""
          expect(@order_address).to be_valid
        end
      end

      context "購入が失敗する場合" do

        it "カードのトークンがない場合" do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end

        it "郵便番号がない場合" do
          @order_address.postcode = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
        end

        it "都道府県がない場合" do
          @order_address.prefecture_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
        end

        it "市区町村がない場合" do
          @order_address.city = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end

        it "番地がない場合" do
          @order_address.block = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Block can't be blank")
        end

        it "電話番号がない場合" do
          @order_address.phone_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end

        it "郵便番号にハイフンがない場合" do
          @order_address.postcode = "1234567"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postcode is invalid")
        end

        it "電話番号にハイフンがある場合" do
          @order_address.phone_number = "0901234-567"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid")
        end

        it "電話番号が11文字以上の場合" do
          @order_address.phone_number = "090123456789"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
        end
      end

    end
  end