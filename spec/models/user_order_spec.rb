require 'rails_helper'
describe UserOrder do
 before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it "配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が正しく入力されている" do
        expect(@user_order).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it "郵便番号が空だと登録できない" do
        @user_order.postal_code  = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号にハイフンがないと登録できない" do
        @user_order.postal_code  = 1234567
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid")
      end
      it "都道府県が空だと登録できない" do
        @user_order.area_id  = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Area Slect")
      end
      it "市町村が空だと登録できない" do
        @user_order.city  = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空だと登録できない" do
        @user_order.house_number  = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("House number can't be blank")
      end
      it "電話番号が空だと登録できない" do
        @user_order.phone_number  = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end

