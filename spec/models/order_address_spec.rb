require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入履歴の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
          expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_numが空だと保存できないこと' do
        @order_address.post_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post num can't be blank")
      end
      it 'post_numが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_num = '1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post num is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'street_numberが空だと保存できないこと' do
        @order_address.street_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street number can't be blank")
      end
      it 'phone_numが空だと保存できないこと' do
        @order_address.phone_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numが10桁以上11桁以内の半角数値のみの形式でないと保存できないこと' do
        @order_address.phone_num = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num は10桁以上11桁以内の半角数値で入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end