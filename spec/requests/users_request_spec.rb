require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before(:example) { get users_path }
    it 'Should return is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should have a body' do
      expect(response.body).to include("List of User's")
    end
  end

  describe 'GET /show' do
    before(:example) { get('/users/20') }
    it 'Should return a success status' do
      expect(response).to have_http_status(:ok)
    end

    it "it render 'show' template" do
      expect(response).to render_template('show')
    end

    it 'Should have a body' do
      expect(response.body).to include('Details Asbout User')
    end
  end
end
