require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、password、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できる" do
      end
      it "passwordが英数字を含む6文字以上であれば登録できる" do
      end
      it "first_nameが全角文字であれば登録できる" do
      end
      it "last_nameが全角文字であれば登録できる" do
      end
      it "first_name_kanaが全角カナであれば登録できる" do
      end
      it "last_name_kanaが全角カナであれば登録できる" do
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "emailが空だと登録できない" do
      end
      it "emailに@がない場合は登録できない" do
      end
      it "重複したemailが存在する場合は登録できない" do
      end
      it "passwordが空だと登録できない" do
      end
      it "passwordが5文字以下だと登録できない" do
      end
      it "passwordに数字が含まれていないと登録できない" do
      end
      it "passwordに英字が含まれていないと登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
      it "first_nameが空だと登録できない" do
      end
      it "last_nameが空だと登録できない" do
      end
      it "first_name_kanaが空だと登録できない" do
      end
      it "last_name_kanaが空だと登録できない" do
      end
      it "birthdayが空だと登録できない" do
      end
    end
  end
end