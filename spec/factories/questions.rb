FactoryBot.define do
  sequence :title do |n|
    "My #{n} question"  
  end

  factory :question do
    title
    body { "QuestionBodyText" }

    trait :invalid do
      title {nil}
      body {nil}
    end
  end
end
