FactoryBot.define do
  factory :tutor do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    course { Course.order(Arel.sql('RANDOM()')).first }
  end
end
