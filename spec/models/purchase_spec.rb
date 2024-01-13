require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end


  context '内容に問題ない場合' do
    it "" do
    expect(@order).to be_valid
    end
  end

  it "tokenが空では登録できないこと" do
    @purchase.token = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Token can't be blank")
  end