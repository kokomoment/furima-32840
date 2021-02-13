require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、password、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在する" do
      end
      it "passwordが英数字を含む6文字以上" do
      end
      it "first_nameが全角文字" do
      end
      it "last_nameが全角文字" do
      end
      it "first_name_kanaが全角カナ" do
      end
      it "last_name_kanaが全角カナ" do
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空" do
      end
      it "emailが空" do
      end
      it "emailに@がない" do
      end
      it "重複したemailが存在する" do
      end
      it "passwordが空" do
      end
      it "passwordが5文字以下" do
      end
      it "passwordが半角数字のみ" do
      end
      it "passwordが半角英字のみ" do
      end
      it "passwordとpassword_confirmationが不一致" do
      end
      it "first_nameが空" do
      end
      it "last_nameが空" do
      end
      it "first_name_kanaが空" do
      end
      it "last_name_kanaが空" do
      end
      it "birthdayが空" do
      end
    end
  end
end