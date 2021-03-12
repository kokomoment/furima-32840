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
        @order_address.postcode = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postcodeにハイフンが含まれない' do
        @order_address.postcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postcode Input correctly')
      end

      it 'postcodeが全角数字' do
        @order_address.postcode = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postcode Input correctly')
      end

      it 'postcodeの数字の個数が少ない' do
        @order_address.postcode = '123-456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postcode Input correctly')
      end

      it 'prefecture_idが1' do
        @order_address.prefecture_id = Prefecture.find(1)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture Select')
      end

      it 'cityが空' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空' do
        @order_address.block = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが全角数字' do
        @order_address.phone_number = '０１２３４５６７８９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input only number')
      end

      it 'phone_numberが10桁未満' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        binding.pry
        expect(@order_address.errors.full_messages).to include('Phone number Input only number')
      end

      it 'tokenが空' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
