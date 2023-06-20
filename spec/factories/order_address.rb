FactoryBot.define do
  factory :order_address do
    post_num      { '123-1234' }
    prefecture_id { 3 }
    city          { '名古屋市' }
    street_number { '14-19' }
    building_name { 'テストビル' }
    phone_num     { '09012341234' }
  end
end
