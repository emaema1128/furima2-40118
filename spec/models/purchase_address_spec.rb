require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

  describe '購入者情報の保存' do
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postalcodeが空だと購入できない' do
        @purchase_address.postalcode = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'postalcodeは「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @purchase_address.postalcode = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid")
      end
      it 'prefectureが空だと購入できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'blockが空だと購入できない' do
        @purchase_address.block = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Number can't be blank")
      end
      it 'phone_numberは9桁以下だと購入できない' do
        @purchase_address.phone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Number is invalid")
      end
      it 'phone_numberは12桁以上だと購入できない' do
        @purchase_address.phone_number = '123456789123'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Number is invalid")
      end
      it 'phone_numberは半角数字以外が含まれている場合だと購入できない' do
        @purchase_address.phone_number = '090-1234'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Number is invalid")
      end
      it 'city_idに「0」が選択されている場合は出品できない' do
        @purchase_address.city_id = '0'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ購入できない' do
        @purchase_address.user = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('User must exist')
      end
      it 'itemが紐付いていなければ購入できない' do
        @purchase_address.item = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Item must exist')
      end
    end
  end
end
