require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品登録' do
    context '商品出品登録できるとき' do

      it '正常に登録できる' do
        expect(@item).to be_valid
      end

    end

    context '商品出品登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'titleが空では登録できない' do
        @item.title = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it 'explainが空では登録できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end

      it 'freight_idが空では登録できない' do
        @item.freight_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Freight can't be blank")
      end

      it 'shipping_idが空では登録できない' do
        @item.shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end

      it 'shipdate_idが空では登録できない' do
        @item.shipdate_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipdate can't be blank")
      end

      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが全角では登録できない' do
        @item.price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '販売価格が¥300より少ないときは出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格が¥9999999より多いいときは出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.freight_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Freight can't be blank")
      end

      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shipping_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end

      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.shipdate_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipdate can't be blank")
      end

    end
  end
end
