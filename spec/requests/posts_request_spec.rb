require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before(:example) { get('/users/22/posts') }
    it 'should return is a success' do
      # get posts_index_path
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should have a body' do
      expect(response.body).to include('List of Post')
    end
  end

  describe 'GET /show' do
    before(:example) { get('/users/20/posts/31') }
    it 'Should return a success status' do
      expect(response).to have_http_status(:ok)
    end

    it "it render 'show' template" do
      expect(response).to render_template('show')
    end

    it 'Should have a body' do
      expect(response.body).to include('Details About Post')
    end
  end
end
