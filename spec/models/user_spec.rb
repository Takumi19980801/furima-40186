require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと保存できないこと' do
        @user.first_name = '0801'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと保存できないこと' do
        @user.last_name = '0801'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end
      it 'kana_first_nameが全角カタカナでないと保存できないこと' do
        @user.kana_first_name = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid. Input full-width katakana characters.')
      end
      it 'kana_last_nameが全角カタカナでないと保存できないこと' do
        @user.kana_last_name = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name is invalid. Input full-width katakana characters.')
      end
      it 'passwordが英字のみでは保存できないこと' do
        @user.password = 'すずきたくみ'
        @user.password_confirmation = 'すずきたくみ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers.')
      end
      it 'passwordが数字のみでは保存できないこと' do
        @user.password = 'すずきたくみ'
        @user.password_confirmation = 'すずきたくみ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers.')
      end
      it 'passwordが全角文字は保存できないこと' do
        @user.password = 'すずきたくみ'
        @user.password_confirmation = 'すずきたくみ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers.')
      end
    end
  end
end
