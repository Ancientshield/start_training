# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'update task', type: :feature do
  let!(:exist_task) { create(:task, title: 'Feature Test 003', created_at: '2020-03-13 12:00', end_time: '2020-03-23 12:00') }

  scenario 'valid inputs' do
    visit edit_task_path(id: exist_task.id.to_s)
    fill_in (I18n.t :task_title).to_s, with: 'Feature Test 003'
    click_on (I18n.t :sure).to_s
    visit tasks_path
    expect(page).to have_content('Feature Test 003')
    expect(Task.find_by(id: exist_task.id.to_s).title).to eq 'Feature Test 003'
  end
end
