FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    uid { "123456789" }
    provider { "google_oauth2" }
  end
end
