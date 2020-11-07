require 'rails_helper'

RSpec.describe Item, type: :model do
  before do

  end

  describe '出品商品登録' do
    context '新規登録がうまくいくとき' do
      it 'image,product_name,explanation,category_id,product_status_id,delivery_burden_id,
          prefectures_id,shipping_period_id,priceが存在すれば保存できる' do
          # expect().to be_valid
      end
    end
  
    context '新規登録がうまくいかないとき' do
      it 'imageが無い' do
      end
      it 'product_nameが空' do
      end
      it 'explanationが空' do
      end
      it 'category_idが0を選択している' do
      end
      it 'product_status_idが0を選択している' do
      end
      it 'delivery_burden_idが0を選択している' do
      end
      it 'prefectures_idが0を選択している' do
      end
      it 'shipping_period_idが0を選択している' do
      end
      it 'priceが空' do
      end
      it 'priceが300円未満' do
      end
      it 'priceが一千万円異常' do
      end
    end
  end
end
