FactoryBot.define do
  factory :answer do
    body { "MyText" }
    title { "MyString" }
    question { nil }

    trait :invalid do
      body { nil }
      title { nil }
    end
  end
end
