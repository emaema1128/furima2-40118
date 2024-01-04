require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    # ユーザー新規登録についてのテストコードを記述します  
    it 'nicknameが空では登録できない' do
      # nicknameが空では登録できないテストコードを記述します
      @user.nickname = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")

    end
    it 'emailが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
      @user.email = ''  # emailの値を空にする

      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
