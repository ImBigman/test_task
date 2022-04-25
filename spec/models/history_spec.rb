# frozen_string_literal: true

require 'rails_helper'

RSpec.describe History, type: :model do
  describe 'associations' do
    it { should belong_to(:post) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:created_at) }
  end
end
