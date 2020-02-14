# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe '#index' do
    it 'responds a 200 response' do
      get :index
      expect(response).to have_http_status '200'
    end
  end

  describe '#create' do
    it 'create a task' do
      @task = FactoryBot.create(:task)
    end
  end
end
