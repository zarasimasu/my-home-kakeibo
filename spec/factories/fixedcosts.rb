FactoryBot.define do
  factory :fixedcost do
    fixedcost_category_id {2}
    value {1000}
    year_month {2020-01-01}
    description {"備考"}
    association :user
  end
end
