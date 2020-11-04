require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email、encrypted_password,password_confirmation,f_name,l_name,f_name_kana,l_name_kana,birthdayが存在すれば登録できる" do
      end
    end
    
    context '新規登録がうまくいかないとき' do
    it "nicknameが空だと登録できない" do
    end
      it "emailが空だと登録できない" do
      end
      it "encrypted_passwordが空だと登録できない" do
      end
      it "f_nameが空だと登録できない" do
      end
      it "l_nameが空だと登録できない" do
      end
      it "f_name_kanaが空だと登録できない" do
      end
      it "l_name_kanaが空だと登録できない" do
      end
      it "birthdayが空だと登録できない" do
      end
    end
  end
