# frozen_string_literal: true

# PostMailer
#
class PostMailer < ApplicationMailer
  attr_accessor :resource

  def new_post(record)
    @resource = record

    mail(to: @resource.author, subject: "New post was created at #{@resource.history.created_at}")
  end
end
