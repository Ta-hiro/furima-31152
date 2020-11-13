require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品購入配送先登録' do
    context '配送先登録がうまくいくとき' do
      it 'postal_code,prefectures_id,city,house_number,building_name,phone_numberが存在すれば保存できる' do
        expect(@address).to be_valid
      end
      it 'building_nameが入力されてなくても保存できる' do
        @address.building_name = nil
        expect(@address).to be_valid
      end
    end

    context '配送先登録がうまくいかないとき' do
      it 'postal_codeが入力されていないとき' do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが入力されていないとき' do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefectures_idが入力されていないとき' do
        @address.postal_code = 0
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'house_numberが入力されていないとき' do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'building_nameが入力されていないとき' do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'phone_numberが入力されていないとき' do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
    end
  end
end
