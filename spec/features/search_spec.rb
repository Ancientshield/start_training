# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'search spec', type: :feature do
  let!(:task_008) { create(:task, title: 'Task Order 008', state: 'pending', priority: 'high', degree: 3, created_at: '2020-03-11 10:00', end_time: '2020-03-22 12:00') }

  scenario 'verify search result' do
    visit tasks_path
    page.fill_in 'q_title_or_content_cont', with: 'Task Order 008'
    find_button('commit03').click
    expect(page).to have_text('Task Order 008')
    expect(task_008.state).to eq 'pending'
  end
end
