require 'rails_helper'

describe OrderAddress do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入情報の保存' do
    context '商品購入情報の保存がうまくいくとき' do
      it 'すべての値が正しく入力されており、tokenがあれば保存できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入情報の保存がうまくいかないとき' do
      it 'postcodeが空' do
      end

      it 'postcodeにハイフンが含まれない' do
      end

      it 'postcodeが全角数字' do
      end

      it 'prefecture_idが1' do
      end

      it 'cityが空' do
      end

      it 'blockが空' do
      end

      it 'phone_numberが空' do
      end

      it 'phone_numberが全角数字' do
      end

      it 'tokenが空'
      end
    end
  end
end
