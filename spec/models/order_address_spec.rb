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
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_numが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_num = '1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号は正しい形式で入力してください（ハイフンを含む）')
      end
      it 'prefectureが空だと保存できないこと' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県は--以外を選択してください")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'street_numberが空だと保存できないこと' do
        @order_address.street_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("住所（番地）を入力してください")
      end
      it 'phone_numが空だと保存できないこと' do
        @order_address.phone_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numが9桁以下だと保存できない' do
        @order_address.phone_num = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は10桁以上11桁以内の半角数値で入力してください')
      end
      it 'phone_numが12桁以上だと保存できない' do
        @order_address.phone_num = '123456789123'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は10桁以上11桁以内の半角数値で入力してください')
      end
      it 'phone_numに数字以外の文字が含まれていると保存できない' do
        @order_address.phone_num = '11111あああああ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は10桁以上11桁以内の半角数値で入力してください')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("購入者情報が存在しません")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("購入商品情報が存在しません")
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("トークンが存在しません")
      end
    end
  end
end
