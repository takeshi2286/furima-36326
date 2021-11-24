FactoryBot.define do
  factory :item do
    name              {'テスト'}
    content           {'テストテスト'}
    category_id       {'3'}
    status_id         {'2'}
    shipping_fee_id   {'2'}
    prefecture_id     {'2'}
    derivery_id       {'2'}
    price             {'500'}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
