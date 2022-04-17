# frozen_string_literal: true

# Posts::Create
#
module Posts
  class Create
    include Interactor

    delegate :params, :post, to: :context

    after { notice }

    def call
      context.post = Post.create!(params)
      post.history.create!(type: 'New post', user: post.author)

    rescue StandardError => e
      context.fail!(error: e)
    end

    def notice
      ::PostNotificationWorker.perform_async(post)
    end
  end
end
