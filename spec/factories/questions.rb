FactoryBot.define do
  sequence :title do |n|
    "My #{n} question"  
  end

  factory :question do
    title
    body { "MyText" }

    trait :invalid do
      title {nil}
      body {nil}
    end
  end
end
