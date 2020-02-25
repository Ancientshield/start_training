# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'delete task', type: :feature do
  let!(:exist_task) { create(:task, title: 'Feature Test 002') }

  scenario 'success' do
    # Task.create!(title: 'Feature Test 002')
    visit tasks_path
    expect(page).to have_content('Feature Test 002')
    click_on (I18n.t :delete_task).to_s
    expect(page).not_to have_content('Feature Test 002')
    expect(Task.last).to eq nil
  end
end
