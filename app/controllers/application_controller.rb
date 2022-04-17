# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::RequestForgeryProtection

  respond_to :json
end
