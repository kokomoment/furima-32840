require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '商品出品がうまくいくとき' do
      it 'image、product、explain、category_id、state_id、ship_fee_id、prefecture_id、ship_date_id、priceが存在する'
        
      end
      it 'priceが半角数字' do
       
      end
      it 'priceが300以上' do
        
      end
      it 'priceが9,999,999以下' do

      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空' do

      end
      it 'productが空' do

      end
      it 'explainが空' do

      end
      it 'category_idが1' do

      end
      it 'state_idが1' do

      end
      it 'ship_fee_idが1' do

      end
      it 'prefecture_idが1' do

      end
      it 'ship_date_idが1' do

      end
      it 'priceが空' do
      
      end
      it 'priceが半角数字以外' do

      end
      it 'priceが300未満' do

      end
      it 'priceが10,000,000以上' do

      end
    end
  end
end

