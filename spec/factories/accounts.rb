# frozen_string_literal: true

FactoryBot.define do
  factory :account, class: Account do
    login { Faker::Internet.username }

    password { Faker::Internet.password(8) }

    factory :account_with_password_confirmation do
      password_confirmation { password }
    end

    factory :account_with_bad_password_confirmation do
      password_confirmation { Faker::Internet.password(8) }
    end
  end
end
