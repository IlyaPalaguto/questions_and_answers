FactoryBot.define do
  sequence :email do |n|
    "sample#{n}@mail.com"
  end
  factory :user do
    email
    password { 'qwer1234' }
    password_confirmation { 'qwer1234' }
  end
end
