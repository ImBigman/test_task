# frozen_string_literal: true

# PostNotificationWorker
#
class PostNotificationWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'post_notifications'

  def perform(record)
    ::PostMailer.new_post(record).deliver

  rescue StandardError => e
    Rails.logger.error(e.message)
  end
end
