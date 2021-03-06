require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname、email、password、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在する' do
        expect(@user).to be_valid
      end
      it 'passwordが英数字を含む6文字以上' do
        @user.password = '000egg'
        @user.password_confirmation = '000egg'
        expect(@user).to be_valid
      end
      it 'first_nameが全角文字' do
        @user.first_name = '山田'
        expect(@user).to be_valid
      end
      it 'last_nameが全角文字' do
        @user.last_name = '太郎'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角カナ' do
        @user.first_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'last_name_kanaが全角カナ' do
        @user.last_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がない' do
        @user.email = '123gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが英数字を含む5文字以下' do
        @user.password = '12egg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角数字のみ' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
      end
      it 'passwordが半角英字のみ' do
        @user.password = 'eggegg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
      end
      it 'passwordに全角文字が含まれる' do
        @user.password = '12eggたまご'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
      end
      it 'passwordとpassword_confirmationが不一致' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが漢字・平仮名・カタカナ以外' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end
      it 'last_nameが空' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが漢字・平仮名・カタカナ以外' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters')
      end
      it 'first_name_kanaが空' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが全角カタカナ以外' do
        @user.first_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width characters')
      end
      it 'last_name_kanaが空' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが全角カタカナ以外' do
        @user.last_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Full-width characters')
      end
      it 'birthdayが空' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
