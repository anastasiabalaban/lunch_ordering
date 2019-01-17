# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name     { Faker::Name.first_name }
    role     { User::USER }
    email    { Faker::Internet.email }
    password { SecureRandom.base64(8) }
    password_confirmation { password }
  end

  trait :admin do
    role { User::ADMIN }
  end
end
