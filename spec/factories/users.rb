FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { SecureRandom.base64(8) }
    password_confirmation { password }
    confirmed_at Time.zone.now
  end
end
