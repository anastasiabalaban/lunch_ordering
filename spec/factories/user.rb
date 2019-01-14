# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    role 'user'
    email { Faker::Internet.email }
    password { SecureRandom.base64(8) }
    password_confirmation { password }
  end

  trait :admin do
    role 'admin'
  end
end
