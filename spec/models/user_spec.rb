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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)を入力してください")
      end
      it 'last_nameが空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("氏名(全角)を入力してください")
      end
      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(カナ)を入力してください")
      end
      it 'last_name_kanaが空では登録できないこと' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("氏名(カナ)を入力してください")
      end
      it 'birth_dateが空では登録できないこと' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it 'passwordは6文字以上の半角英数字でないと登録できないこと' do
        @user.password = '123ey'
        @user.password_confirmation = '123ey'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'password_confirmationとpasswordが不一致では登録できないこと' do
        @user.password = 'test4242'
        @user.password_confirmation = 'test424'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'first_nameは全角文字で記入しないと登録できないこと' do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)全角文字を使用してください")
      end
      it 'last_nameは全角文字で記入しないと登録できないこと' do
        @user.last_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("氏名(全角)全角文字を使用してください")
      end
      it 'first_name_kanaは全角のカタカナで記入しないと登録できないこと' do
        @user.first_name_kana = 'wada'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(カナ)カタカナを使用してください")
      end
      it 'last_name_kanaは全角のカタカナで記入しないと登録できないこと' do
        @user.last_name_kana = 'takumi'
        @user.valid?
        expect(@user.errors.full_messages).to include("氏名(カナ)カタカナを使用してください")
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end 
      it 'emailは@無しでは登録できないこと' do
        @user.email = 'hogehuga.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordは数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordは英字のみでは登録できないこと' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordは全角では登録できないこと' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
    context '新規登録ができる時' do
      it 'ユーザー登録に必要な記述が存在すれば登録できること' do
        expect(@user).to be_valid
      end  
    end
  end
end
