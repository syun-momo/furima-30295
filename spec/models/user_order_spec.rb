require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品購入' do
    it '全ての値が揃っている時住所登録できる' do
      expect(@user_order).to be_valid
    end

    it '建物が空でも登録できる' do
      @user_order.building = ''
      expect(@user_order).to be_valid
    end
  end

  context '商品購入がうまく行かない時' do
    it '郵便番号が空では決済できない' do
      @user_order.postal_code = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にはハイフンが必要であること' do
      @user_order.postal_code = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code -を使用してください")
    end

    it '都道府県が空では決済できない' do
      @user_order.prefecture_id = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '都道府県は1以外が選択されないと登録できない' do
      @user_order.prefecture_id = 1
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it '市区町村が空では決済できない' do
      @user_order.city = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空では決済できない' do
      @user_order.address = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空では決済できない' do
      @user_order.phone_number = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号は11桁以内である' do
      @user_order.phone_number = '00000000'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Phone number 半角数字を使用してください')
    end

    it '電話番号にはハイフンは不要である' do
      @user_order.phone_number = '080-1234-5678'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Phone number 半角数字を使用してください')
    end

    it 'tokenが空では登録できない' do
      @user_order.token = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空だと登録できない' do
      @user_order.user_id = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空だと登録できない' do
      @user_order.item_id = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Item can't be blank")
    end
  end
end
