FactoryBot.define do
  factory :user do
    nickname              { 'テスト' }
    email                 {  Faker::Internet.email }
    password              { '1a1a1a1a' }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '太郎' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    day_of_birth          { Date.parse('1997-01-01')}
  end
end
