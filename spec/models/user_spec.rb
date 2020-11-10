require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、first_name 、last_name、 first_name_kana、last_name _kana 、birthday が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上の半角英数字であれば登録できる" do
        expect(@user).to be_valid
      end
      it "first_nameが全角かなであれば登録できる" do
        @user.first_name = "阿部"
        expect(@user).to be_valid
      end
      it "last_nameが全角かなであれば登録できる" do
        @user.last_name = "宏"
        expect(@user).to be_valid
      end
      it "first_name_kanaが全角カナであれば登録できる" do
        @user.first_name_kana = "アベ"
        expect(@user).to be_valid
      end
      it "last_name_kanaが全角カナであれば登録できる" do
        @user.last_name_kana = "ヒロシ"
        expect(@user).to be_valid
      end
    end
  end
   
  context '新規登録がうまくいかないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user = FactoryBot.build(:user)
      @user.email = ""
      @user.valid?
    end
    it "同じemailは登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@が含まれていないと登録できない" do
      @user.email = "aaa.xs"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが6文字未満だと登録できない" do
      @user.password = "gdwg"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが全角かなだと登録できない" do
      @user.password = "ああああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "first_nameが英数字だと登録できない" do
      @user.first_name = "sq12"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "last_nameが英数字だと登録できない" do
      @user.last_name = "ada12"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "first_name_kanaが英数字だと登録できない" do
      @user.first_name_kana = "dwed1"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角文字を使用してください")
    end
    it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "last_name_kanaが英数字だと登録できない" do
      @user.last_name_kana = "sqw1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角文字を使用してください")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
