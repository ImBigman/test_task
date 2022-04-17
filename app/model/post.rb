# frozen_string_literal: true

class Post < ApplicationRecord
  self.table_name = 'posts'

  has_one :history, class_name: 'History', dependent: :destroy

  validates :author, :title, :body, presence: true
  validates :author, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Email format invalid!' }
end
