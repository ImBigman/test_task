# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let(:posts) { create_list(:post, 3) }
  let(:base_url) { '/posts' }
  let(:headers) { { "CONTENT_TYPE" => "application/json" } }

  describe 'GET #index' do
    before { posts }
    it 'responds with 200 status' do
      get base_url, headers: headers

      expect(response.status).to eq(200)
    end

    it 'responds with list of objects' do
      get base_url, headers: headers

      expect(json['data'].count).to eq(3)
    end
  end

  describe 'POST #create' do
   let(:correct_params) { build(:post_params) }
   let(:invalid_params) { build(:post_invalid_params) }

    it 'responds with a 201 status' do
      post base_url, params: correct_params.to_json, headers: headers

      expect(response).to have_http_status(:created)
    end

    it 'responds with correct data' do
      post base_url, params: correct_params.to_json, headers: headers

      expect(json['data'].keys).to match_array(%w[author title body])
      expect(json['data']['author']).to_not be_empty
      expect(json['data']['title']).to_not be_empty
      expect(json['data']['body']).to_not be_empty
    end

    it 'creates history for post' do
      expect { post base_url, params: correct_params.to_json, headers: headers }.to change(History, :count).by(1)
    end

    it 'responds with a 422 status' do
      post base_url, params: invalid_params.to_json, headers: headers

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
