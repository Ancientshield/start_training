# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'task order by end time', type: :feature do
  let!(:task_003) { create(:task, title: 'Task Order 003', created_at: '2020-03-10 12:00', end_time: '2020-03-20 12:00') }
  let!(:task_004) { create(:task, title: 'Task Order 004', created_at: '2020-03-10 13:00', end_time: '2020-03-15 12:00') }

  scenario 'verify order & end time' do
    visit tasks_path(params: { order: :end_time })
    expect(page.text.index('Task Order 004')).to be < page.text.index('Task Order 003')
    expect(task_004.end_time).to be < task_003.end_time
  end
end
