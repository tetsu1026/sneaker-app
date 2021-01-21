require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '新規登録' do
    context '新規登録できる時' do
      it '登録情報が全て入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
     context '新規登録できない時' do
      it 'emailがないと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")  
      end
      it '同じemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ""
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは2回入力しないと登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは半角英数字ふくめた6文字以上じゃないと登録できない' do
        @user.password = "aaa11"
        @user.password_confirmation = "aaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは半角数字だけでは登録できない' do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角の英字数字の両方を含めて設定してください")
      end
      it 'passwordは半角英語だけでは登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角の英字数字の両方を含めて設定してください")
      end
      it 'passwordは全角では登録できない' do
        @user.password = "ａａａ１１１"
        @user.password_confirmation = "ａａａ１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角の英字数字の両方を含めて設定してください")
      end
      it 'passwordは1回目と2回目が一致していないと登録できない' do
        @user.password = "aaa111"
        @user.password_confirmation = "bbb111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'nicknameがないと登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'my sizeの入力がないと登録できない' do
        @user.size_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Size Select")
      end
      it 'profileの入力がないと登録できない' do
        @user.profile = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Profile can't be blank")
      end
      it '名前(全角)の入力がないと登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '苗字(全角)の入力がないと登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名前は全角でないと登録できない' do
        @user.first_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it '苗字は全角でないと登録できない' do
        @user.last_name = "ﾔﾏﾀ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it '名前(カナ)の入力がないと登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '苗字(カナ)の入力がないと登録できない' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '名前(カナ)は全角出なければ登録できない' do
        @user.first_name_kana = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角(カタカナ)を使用してください")
      end
      it '苗字(カナ)の入力は全角出ないと登録できない' do
          @user.last_name_kana = "ﾔﾏﾀ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana 全角(カタカナ)を使用してください")
        end
      it '生年月日の入力がないと投稿できない' do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
