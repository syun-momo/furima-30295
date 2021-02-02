require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      # user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      # @item = FactoryBot.build(:item)
      # @user = FactoryBot.build(:user)
      # @item.image = fixture_file_upload('spec/images/test.jpg')
    end

    context '商品登録がうまくいく時' do
      it '入力項目の値が全て存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまく行かない時' do
      it '画像は1枚必須であること(ActiveStorage)' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーの情報が必至であること' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報が必須であること' do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担についての情報が必須であること' do
        @item.shopping_fee_status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping fee status can't be blank")
      end
      it '配送元の地域についての情報が必須であること' do
        @item.prefectures_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end
      it '発送までの日数についての情報が必須であること' do
        @item.scheduled_delivery = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it '価格についての情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、￥300~￥9,999,999の間であること' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
