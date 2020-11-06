FactoryBot.define do
  factory :saving do
    day {2020-01-01}
    saving {10000}
    association :user
  end
end
