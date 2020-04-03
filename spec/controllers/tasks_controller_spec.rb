# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe '#index' do
    user = User.create(name: 'test', email: 'test@gmail.com', password: 'password')
    fill_in 'Name', with: 'test'
    fill_in 'Password', with: 'password'
    click_on 'Login'
    it 'responds a 200 response' do
      get :index
      expect(response).to have_http_status '200'
    end
  end
end
