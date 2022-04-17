# frozen_string_literal: true

FactoryBot.define do
  factory :post, class: 'Post' do
    author { Faker::Internet.email }
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.sentence }
  end

  factory :post_params, class: Hash do
    initialize_with do
      {
        author: Faker::Internet.email,
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.sentence
      }
    end
  end

  factory :post_invalid_params, class: Hash do
    initialize_with do
      {
        author: nil,
        title: nil,
        body: nil
      }
    end
  end
end
