# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'task order by create time', type: :feature do
  # let!(:task_001) { create(:task, title: 'Task Order 001', state: 'pending', priority: 'high', degree: 3, created_at: '2020-03-10 10:00', end_time: '2020-03-21 12:00') }
  # let!(:task_002) { create(:task, title: 'Task Order 002', state: 'pending', priority: 'high', degree: 3, created_at: '2020-03-10 11:00', end_time: '2020-03-22 12:00') }

  scenario 'verify order & timestamp' do
    visit login_path
    fill_in 'name', with: 'admin'
    fill_in 'password', with: 'asdf1234'
    click_on 'commit'
    visit new_task_path
    fill_in (I18n.t :task_title).to_s, with: 'Task Order 001'
    click_on (I18n.t :sure).to_s
    visit new_task_path
    fill_in (I18n.t :task_title).to_s, with: 'Task Order 002'
    click_on (I18n.t :sure).to_s
    visit tasks_path
    page.select I18n.t :create_time, from: 'order'
    find_button('commit01').click
    expect(page.text.index('Task Order 001')).to be < page.text.index('Task Order 002')
  end
end
