FactoryBot.define do
  factory :order do
    token {"tok_abcdefghijk00000000000000000"}
    post_number       {'123-4567'}
    prefecture_id     {'2'}
    purchaser_city    {'横浜市'}
    purchaser_address {'2-1-1'}
    purchaser_building{'テックモデル'}
    telephone_number  {'09000000000'}
  end
end
