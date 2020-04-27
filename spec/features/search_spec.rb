# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'search spec', type: :feature do
  # let!(:task_007) { create(:task, title: 'Task Order 008', state: 'pending', priority: 'high', degree: 3, created_at: '2020-03-11 10:00', end_time: '2020-03-22 12:00') }

  scenario 'verify search result' do
    visit login_path
    fill_in 'name', with: 'admin01'
    fill_in 'password', with: 'asdf1234'
    click_on 'commit'
    visit new_task_path
    fill_in (I18n.t :task_title).to_s, with: 'Task Order 007'
    page.choose("task_state_#{I18n.t :pending}").click
    click_on (I18n.t :sure).to_s
    visit tasks_path
    page.fill_in 'q_title_or_content_or_tags_name_cont', with: 'Task Order 007'
    find_button('commit03').click
    expect(page).to have_text('Task Order 007')
    expect(Task.last.state).to eq (I18n.t :pending).to_s
  end
end
