require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品出品がうまくいくとき' do
      it 'image、product、explain、category_id、state_id、ship_fee_id、prefecture_id、ship_date_id、priceが存在する' do
        expect(@item).to be_valid
      end
      it 'priceが半角数字' do
        @item.price = '12345'
        expect(@item).to be_valid
      end
      it 'priceが300以上' do
        @item.price = '300'
        expect(@item).to be_valid
      end
      it 'priceが9,999,999以下' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'productが空' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it 'explainが空' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'category_idが1' do
        @item.category = Category.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'state_idが1' do
        @item.state = State.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include('State Select')
      end
      it 'ship_fee_idが1' do
        @item.ship_fee = ShipFee.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship fee Select')
      end
      it 'prefecture_idが1' do
        @item.prefecture = Prefecture.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it 'ship_date_idが1' do
        @item.ship_date = ShipDate.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include('Ship date Select')
      end
      it 'priceが空' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'priceが半角英字' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of settintg range')
      end
      it 'priceが半角英数字の混合' do
        @item.price = '300abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'priceが300未満' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of settintg range')
      end
      it 'priceが10,000,000以上' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of settintg range')
      end
    end
  end
end
