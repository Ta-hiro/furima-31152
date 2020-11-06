require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email、password,password_confirmation,f_name,l_name,f_name_kana,l_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
  end

  context '新規登録がうまくいかないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailがすでに登録されていると登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email 
      another_user.valid?
      binding.pry
      expect(another_user.errors.full_messages).to include("email has already been taken")
    end
    it "emailに＠がないと登録できない" do
      @user.email = "tttttt"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下だと登録できない" do
      @user.password = "ab123"
      @user.password_confirmation = @user.password
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Password is too short(minimum is 6 characters)")
    end
    it "passwordが半角英数字を使用してないと登録できない" do
      @user.password = "パスワード１２３"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "password_confirmationが空だと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationが一致しないと登録できない" do
      @user.password = "123456p"
      @user.password_confirmation = "p123456"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "f_nameが空だと登録できない" do
      @user.f_name = ""
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("F name can't be blank")
    end
    it "f_nameが全角漢字、平仮名、片仮名でないと登録できない" do
      @user.f_name = "ddd"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("F name is invalid")
    end
    it "l_nameが空だと登録できない" do
      @user.l_name = ""
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("L name can't be blank")
    end
    it "l_nameが全角全角漢字、平仮名、片仮名でないと登録できない" do
      @user.l_name = "ddd"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("L name is invalid")
    end
    it "f_name_kanaが空だと登録できない" do
      @user.f_name_kana = ""
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("F name kana can't be blank")
    end
    it "f_name_kanaが全角片仮名でないと登録できない" do
      @user.f_name_kana = "d漢ひ"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("F name kana is invalid")
    end
    it "l_name_kanaが空だと登録できない" do
      @user.l_name_kana = ""
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("L name kana can't be blank")
    end
    it "l_name_kanaが全角片仮名でないと登録できない" do
      @user.l_name_kana = "d漢ひ"
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("L name kana is invalid")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
