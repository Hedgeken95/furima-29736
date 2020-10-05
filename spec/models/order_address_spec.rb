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

        it ""


    end
  