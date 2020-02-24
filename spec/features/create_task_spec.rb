# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'create task', type: :feature do
  scenario 'valid inputs' do
    visit new_task_path
    fill_in (I18n.t :task_title).to_s, with: 'feature test title'
    click_on (I18n.t :sure).to_s
    visit tasks_path
    expect(page).to have_content('feature test title')
  end

  scenario 'invalid inputs' do
    visit new_task_path
    fill_in (I18n.t :task_title).to_s, with: ''
    click_on (I18n.t :sure).to_s
    expect(page).to have_content("can't be blank")
  end
end
