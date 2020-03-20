# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'task order by create time', type: :feature do
  let!(:task_001) { create(:task, title: 'Task Order 001', state: 'pending', priority: 'high', created_at: '2020-03-10 10:00', end_time: '2020-03-21 12:00') }
  let!(:task_002) { create(:task, title: 'Task Order 002', state: 'pending', priority: 'high', created_at: '2020-03-10 11:00', end_time: '2020-03-22 12:00') }

  scenario 'verify order & timestamp' do
    visit tasks_path
    page.select I18n.t :create_time, from: 'order'
    find_button('commit').click
    expect(page.text.index('Task Order 001')).to be < page.text.index('Task Order 002')
    expect(task_001.created_at).to be < task_002.created_at
  end
end
