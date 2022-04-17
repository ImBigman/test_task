# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should have_one(:history) }
  end

  describe 'validations' do
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe 'user format validation' do
    let(:post) { build(:post, author: 'invalid_email') }

    it 'says about invalid author email format' do
      post.save
      expect(post.errors.full_messages.first).to eq('Email format invalid!')
    end
  end
end
