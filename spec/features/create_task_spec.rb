# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'create task', type: :feature do
  scenario 'valid inputs' do
    visit new_task_path
    fill_in '任務標題', with: 'feature test title'
    click_on 'Create Task'
    visit tasks_path
    expect(page).to have_content('feature test title')
  end

  scenario 'invalid inputs' do
    visit new_task_path
    fill_in '任務標題', with: ''
    click_on 'Create Task'
    expect(page).to have_content("can't be blank")
  end
end
