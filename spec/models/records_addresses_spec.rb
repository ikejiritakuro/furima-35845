require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @record = FactoryBot.build(:records_addresses, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  describe "商品購入機能" do

    context '商品購入できる時' do
      it '商品が購入できる時' do
        expect(@record).to be_valid
      end
      it '建物名が無くても購入できること' do
        @record.building = ''
        expect(@record).to be_valid
      end
    end
    context '商品購入できない時' do
      it '郵便番号が空では登録できないこと' do
        @record.postal_code = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は3桁ハイフン4桁の半角文字列のみでないと登録できないこと' do
        @record.postal_code = 1234567
        @record.valid?
        expect(@record.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が空では登録できないこと' do
        @record.prefecture_id = 1
        @record.valid?
        expect(@record.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では登録できないこと' do
        @record.municipality = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空では登録できないこと' do
        @record.address = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できないこと' do
        @record.phone_number = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は10桁以上、11桁の半角数値のみでなければ登録ができないこと' do
        @record.phone_number = 1234567
        @record.valid?
        expect(@record.errors.full_messages).to include("Phone number 半角数字で入力して下さい")
      end
      it '電話番号が9桁以下だと登録できないこと' do
        @record.phone_number = 123456789
        @record.valid?
        expect(@record.errors.full_messages).to include("Phone number 半角数字で入力して下さい")
      end
      it '電話番号が12桁以上だと登録できないこと' do
        @record.phone_number = 123456789876
        @record.valid?
        expect(@record.errors.full_messages).to include("Phone number 半角数字で入力して下さい")
      end
      it 'tokenが空では登録できないこと' do
        @record.token = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("Token can't be blank")
      end
      it 'userと紐づいていないと登録できないこと' do
        @record.user_id = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("User can't be blank")
      end
      it 'itemと紐づいていないと登録できないこと' do
        @record.item_id = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
