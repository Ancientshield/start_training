# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'update task', type: :feature do
  scenario 'valid inputs' do
    ut = Task.create!(title: 'ut')
    visit edit_task_path(id: ut.id)
    fill_in (I18n.t :task_title).to_s, with: 'Feature Test 003'
    click_on (I18n.t :sure).to_s
    visit tasks_path
    expect(page).to have_content('Feature Test 003')
    expect(Task.find_by(id: ut.id.to_s).title).to eq 'Feature Test 003'
  end
end
