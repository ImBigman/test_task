# frozen_string_literal: true

class History < ApplicationRecord
  self.table_name = 'histories'

  belongs_to :post, class_name: 'Post'

  validates :type, :user, :created_at, presence: true
end
