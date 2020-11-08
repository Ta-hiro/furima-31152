require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品登録' do
    context '新規登録がうまくいくとき' do
      it 'image,product_name,explanation,category_id,product_status_id,delivery_burden_id,
          prefectures_id,shipping_period_id,priceが存在すれば保存できる' do
          expect(@item).to be_valid
      end
    end
  
    context '新規登録がうまくいかないとき' do
      it 'imageが無い' do
        @item.image = nil
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが空' do
        @item.product_name = ""
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'explanationが空' do
        @item.explanation = ""
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが0を選択している' do
        @item.category_id = 0
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it 'product_status_idが0を選択している' do
        @item.product_status_id = 0
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Product status must be other than 0")
      end
      it 'delivery_burden_idが0を選択している' do
        @item.delivery_burden_id = 0
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Delivery burden must be other than 0")
      end
      it 'prefectures_idが0を選択している' do
        @item.prefectures_id = 0
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Prefectures must be other than 0")
      end
      it 'shipping_period_idが0を選択している' do
        @item.shipping_period_id = 0
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Shipping period must be other than 0")
      end
      it 'priceが空' do
        @item.price = ""
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円未満' do
        @item.price = 299
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10000000円以上' do
        @item.price = 10000000
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
