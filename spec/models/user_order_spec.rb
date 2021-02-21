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
    it '郵便番号が空では決済できないこと' do
    end

    it '都道府県が空では決済できないこと' do
    end

    it '市区町村が空では決済できないこと' do
    end

    it '番地が空では決済できないこと' do
    end

    it '電話番号が空では決済できないこと' do
    end

    it '電話番号にはハイフンは不要であること' do
    end

    it '電話番号は11桁以内であること' do
    end

    it 'tokenが空では登録できないこと' do
    end

    it 'user_idが空だと登録できない' do
    end

    it 'item_idが空だと登録できない' do
    end
  end

  
end
