# frozen_string_literal: true

# require 'rails_helper'

# RSpec.feature 'tasks order by priority', type: :feature do
#   let!(:task_005) { create(:task, title: 'Task Order 005', state: 'pending', priority: 'high', created_at: '2020-03-10 10:00', end_time: '2020-03-21 12:00') }
#   let!(:task_006) { create(:task, title: 'Task Order 006', state: 'pending', priority: 'medium', created_at: '2020-03-10 11:00', end_time: '2020-03-22 12:00') }
#   let!(:task_007) { create(:task, title: 'Task Order 007', state: 'pending', priority: 'low', created_at: '2020-03-10 12:00', end_time: '2020-03-23 12:00') }

#   scenario 'verify order & timestamp' do
#     visit tasks_path
#     page.select I18n.t :create_time, from: 'order'
#     find_button('commit').click
#     expect(page.text.index('Task Order 001')).to be < page.text.index('Task Order 002')
#     expect(task_001.created_at).to be < task_002.created_at
#   end
# end
