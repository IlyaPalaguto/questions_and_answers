FactoryBot.define do
  factory :answer do
    body { "AnswerTextBody" }
    title { "AnswerStringTitle" }
    question { create(:question) }
    author { create(:user) }

    trait :invalid do
      body { nil }
      title { nil }
    end
  end
end
