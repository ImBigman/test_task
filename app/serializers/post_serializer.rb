# frozen_string_literal: true

# PostSerializer
#
class PostSerializer < ActiveModel::Serializer
  type :data
  attributes :id, :author, :title, :body
end
