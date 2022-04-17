# frozen_string_literal: true

FactoryBot.define do
  factory :history, class: 'History' do
    association :post, factory: :post
    user { Faker::Internet.email }
    type { Faker::Lorem.sentence }
    created_at { Faker::Time.backward(days: 1) }
  end

  factory :history_params, class: Hash do
    initialize_with do
      {
        user: Faker::Internet.email,
        type: Faker::Lorem.sentence
      }
    end
  end

  factory :history_invalid_params, class: Hash do
    initialize_with do
      {
        user: nil,
        type: nil
      }
    end
  end
end
