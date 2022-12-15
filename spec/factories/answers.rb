FactoryBot.define do
  factory :answer do
    body { "AnswerTextBody" }
    title { "AnswerStringTitle" }
    question { nil }

    trait :invalid do
      body { nil }
      title { nil }
    end
  end
end
