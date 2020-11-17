require 'rails_helper'
RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録がうまくいくとき' do
      it "画像、商品名、商品の説明、カテゴリーの情報、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき'do
      it "画像が空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が空だと登録できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーの情報が選択されていないと登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Slect")
      end
      it "商品の状態が選択されていないと登録できない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition status Select")
      end
      it "配送料の負担が選択されていないと登録できない" do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee fee status Select")
      end
      it "発送元の地域が選択されていないと登録できない" do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Area Select")
      end
      it "発送までの日数が選択されていないと登録できない" do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day delivery Select")
      end
      it "価格が存在していないと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "価格が半角数字以外だと登録できない" do
        @item.price = "１２９０"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "価格帯が300未満だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "価格帯が9999999より大だと登録できない" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end
