# frozen_string_literal: true

module Requests
  module JsonHelpers
    def json
      JSON.parse(last_response.body)
    end
  end

  module JsonHelpersRequest
    def json
      JSON.parse(response.body)
    end
  end

  module RackAttackHelpers
    def setup_rack_attack_cache_store
      Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
    end

    def avoid_test_overlaps_in_cache
      Rails.cache.clear
    end
  end
end

RSpec.configure do |config|
  config.include Requests::JsonHelpers, type: :api
  config.include Requests::JsonHelpersRequest, type: :request
  config.include Requests::RackAttackHelpers, type: :api
end
