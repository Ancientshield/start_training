# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'tasks order by priority', type: :feature do
  let!(:task_005) { create(:task, title: 'Task Order 005', state: 'pending', priority: 'low', degree: 1, created_at: '2020-03-10 10:00', end_time: '2020-03-21 12:00') }
  let!(:task_006) { create(:task, title: 'Task Order 006', state: 'pending', priority: 'medium', degree: 2, created_at: '2020-03-10 11:00', end_time: '2020-03-22 12:00') }
  let!(:task_007) { create(:task, title: 'Task Order 007', state: 'pending', priority: 'high', degree: 3, created_at: '2020-03-10 12:00', end_time: '2020-03-23 12:00') }

  scenario 'verify order & priority' do
    visit tasks_path
    page.select I18n.t :low_to_high, from: 'degree'
    find_button('commit02').click
    expect(page.text.index('Task Order 005')).to be < page.text.index('Task Order 006')
    expect(task_005.degree).to be < task_006.degree
    expect(page.text.index('Task Order 006')).to be < page.text.index('Task Order 007')
    expect(task_006.degree).to be < task_007.degree
  end
end
