require 'rails_helper'

#配送先の住所情報も購入の都度入力させること。

RSpec.describe Order, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    end

    context '購入がうまくいくとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@order).to be_valid
      end

      it '建物名が入力されていなくても登録できる' do
        @order.purchaser_building = ''
        expect(@order).to be_valid
      end

      it "tokenがあれば保存ができること" do
        expect(@order).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it '郵便番号が空では登録できない' do
        @order.post_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number can't be blank")
      end

      it '都道府県の項目が未選択の場合エラーが出る' do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では登録できない' do
        @order.purchaser_city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Purchaser city can't be blank")
      end

      it '番地が空では登録できない' do
        @order.purchaser_address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Purchaser address can't be blank")
      end

      it '電話番号が空では登録できない' do
        @order.telephone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number can't be blank")
      end


      it '電話番号は10桁以上11桁以内の半角数値でなければ保存できない' do
        @order.telephone_number = '０９０１２３４３３３'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number is invalid")
      end

      it '電話番号は9桁以下は保存できない' do
        @order.telephone_number = '090123456'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number is invalid")
      end

      it '電話番号は12桁以上は保存できない' do
        @order.telephone_number = '090123412345'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number is invalid")
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列でなければ保存できない' do
        @order.post_number = '１２３４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it "userが紐づいていなければ登録できないこと" do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it "itemが紐づいていなければ登録できないこと" do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end