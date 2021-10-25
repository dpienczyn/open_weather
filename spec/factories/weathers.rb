FactoryBot.define do
  factory :weather do
    city { Faker::Address.city }
    note { Faker::Lorem.paragraph(sentence_count: 2) }
    temp { Faker::Number.decimal(l_digits: 3, r_digits: 2) }

    user factory: :user
  end
end
