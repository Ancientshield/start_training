# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'delete task', type: :feature do
  scenario 'success' do
    Task.create!(title: 'Feature Test Task')
    visit tasks_path
    expect(page).to have_content('Feature Test Task')
    click_on (I18n.t :delete_task).to_s
    expect(page).not_to have_content('Feature Test Task')
  end
end
