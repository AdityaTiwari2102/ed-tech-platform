FactoryBot.define do
  factory :course do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph_by_chars(number: rand(50..100)) if Faker::Boolean.boolean }
    price { rand(1000..10000) }
    start_date { Faker::Date.between(from: Date.today, to: 3.months.from_now) }
    end_date { Faker::Date.between(from: 4.months.from_now, to: 7.months.from_now) }
    level { ::Course.levels.values.sample }
    category { ::Course.categories.values.sample }
    status { ::Course.statuses.values.sample }
  end
end
