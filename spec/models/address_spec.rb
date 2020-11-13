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
        # binding.pry
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが「333-4444」の形じゃないとき' do
        @address.postal_code = "1234567"
        @address.valid?
        # binding.pry
        expect(@address.errors.full_messages).to include()
      end
      it 'prefectures_idが入力されていないとき' do
        @address.prefectures_id = 0
        @address.valid?
        # binding.pry
        expect(@address.errors.full_messages).to include()
      end
      it 'house_numberが入力されていないとき' do
        @address.house_number = nil
        @address.valid?
        # binding.pry
        expect(@address.errors.full_messages).to include("House number can't be blank")
      end
      it 'building_nameが入力されていないとき' do
        @address.building_name = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Building name can't be blank")
      end
      it 'phone_numberが入力されていないとき' do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
