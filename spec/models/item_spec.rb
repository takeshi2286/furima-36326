require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー出品機能' do
    context '出品がうまくいくとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
      it '販売価格が半角数字であれば登録できる' do
        @item.price = '1000'
        expect(@item).to be_valid
      end
    end  

    context '出品ができないとき' do
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.content = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include ("Content can't be blank")
      end
      it 'カテゴリが空では登録できない' do
        @item.category_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it '商品の状態が空では登録できない' do
        @item.status_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Status can't be blank")
      end
      it '配送料の負担が空では登録できない' do
        @item.shipping_fee_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping fee can't be blank")
      end
      it '発送元の地域が空では登録できない' do
        @item.prefecture_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
      end
      it '発送までの日数が空では登録できない' do
        @item.derivery_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Derivery can't be blank")
      end
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it '商品名が４０文字以上では登録できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name is too long (maximum is 40 characters)")
      end
      it '商品説明が１０００文字以上では登録できない' do
        @item.content = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include ("Content is too long (maximum is 1000 characters)")
      end
      it '価格が299円以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が999999999円を超えたら登録できない' do
        @item.price = '1000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格が全角数字では登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end

