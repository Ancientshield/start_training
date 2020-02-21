# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'update task', type: :feature do
  scenario 'valid inputs' do
    ut = Task.create!(title: 'ut')
    visit edit_task_path(id: ut.id)
    fill_in '任務標題', with: 'Feature Test Task'
    click_on 'Update Task'
    visit tasks_path
    expect(page).to have_content('Feature Test Task')
  end
end
