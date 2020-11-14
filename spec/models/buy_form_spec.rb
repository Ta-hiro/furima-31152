require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  before do
    @buy = FactoryBot.build(:buy_form)
  end

  describe '商品購入機能' do
    context '商品購入登録がうまくいくとき' do
      it 'postal_code,prefectures_id,city,house_number,building_name,phone_number,tokenが存在すれば保存できる' do
        expect(@buy).to be_valid
      end
      it 'building_nameが入力されてなくても保存できる' do
        @buy.building_name = nil
        expect(@buy).to be_valid
      end
    end

    context '商品購入登録がうまくいかないとき' do
      it 'tokenがからのとき' do
        @buy.token = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが入力されていないとき' do
        @buy.postal_code = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが「333-4444」の形じゃないとき' do
        @buy.postal_code = '1234567'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefectures_idが入力されていないとき' do
        @buy.prefectures_id = 0
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Prefectures must be other than 0')
      end
      it 'cityが入力されていないとき' do
        @buy.city = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("City can't be blank")
      end
      it 'cityが全角平仮名、カタカナ、漢字で入力されていないとき' do
        @buy.city = 'ddd'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('City is invalid')
      end
      it 'house_numberが入力されていないとき' do
        @buy.house_number = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが入力されていないとき' do
        @buy.phone_number = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberに-が入力されているとき' do
        @buy.phone_number = '012-3456-7890'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
