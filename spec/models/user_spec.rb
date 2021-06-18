require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do

    context '新規登録できない時' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'encrypted_passwordが空では登録できないこと' do
        @user.encrypted_password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Encrypted_password can't be blank")
      end
      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name can't be blank")
      end
      it 'last_nameが空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last_name can't be blank")
      end
      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
      end
      it 'last_name_kanaが空では登録できないこと' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last_name_kana can't be blank")
      end
      it 'birth_dateが空では登録できないこと' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth_date can't be blank")
      end
      it 'passwordは6文字以上の半角英数字でないと登録できないこと' do
        @user.password = '123ey'
        @user.encrypted_password = '123ey'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'encrypted_passwordとpasswordが不一致では登録できないこと' do
        @user.password = 'test4242'
        @user.encrypted_password = 'test424'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confimation doesn't match Password")
      end
      it 'first_nameは全角文字で記入しないと登録できないこと' do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name 全角文字を使用してください")
      end
      it 'last_nameは全角文字で記入しないと登録できないこと' do
        @user.last_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last_name 全角文字を入力してください")
      end
      it 'first_name_kanaは全角のカタカナで記入しないと登録できないこと' do
        @user.first_name_kana = 'wada'
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name_kana 全角文字のカタカナを入力してください")
      end
      it 'last_name_kanaは全角のカタカナで記入しないと登録できないこと' do
        @user.last_name_kana = 'takumi'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last_name_kana 全角文字のカタカナを入力してください")
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end 
    end
    context '新規登録ができる時' do
      it 'nicknameとemail、passwordとencrypted_passwordが存在すれば登録できること' do
        expect(@user).to be_valid
      end          
    end
  end
end
