# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'tasks order by priority', type: :feature do
  # let!(:task_005) { create(:task, title: 'Task Order 005', state: 'pending', priority: 'low', degree: 1, created_at: '2020-03-10 10:00', end_time: '2020-03-21 12:00') }
  # let!(:task_006) { create(:task, title: 'Task Order 006', state: 'pending', priority: 'medium', degree: 2, created_at: '2020-03-10 11:00', end_time: '2020-03-22 12:00') }
  # let!(:task_007) { create(:task, title: 'Task Order 007', state: 'pending', priority: 'high', degree: 3, created_at: '2020-03-10 12:00', end_time: '2020-03-23 12:00') }

  scenario 'verify order & priority' do
    visit login_path
    fill_in 'name', with: 'admin01'
    fill_in 'password', with: 'asdf1234'
    click_on 'commit'
    visit new_task_path
    fill_in (I18n.t :task_title).to_s, with: 'Task Order 005'
    page.choose("task_priority_#{I18n.t :low}").click
    click_on (I18n.t :sure).to_s
    visit new_task_path
    fill_in (I18n.t :task_title).to_s, with: 'Task Order 006'
    page.choose("task_priority_#{I18n.t :high}").click
    click_on (I18n.t :sure).to_s
    visit tasks_path
    find('#degree').find('option[value=ASC]').select_option
    # page.select I18n.t :low_to_high, from: 'degree'
    find_button('commit02').click
    expect(page.text.index('Task Order 005')).to be < page.text.index('Task Order 006')
  end
end
