# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'task order by create time', type: :feature do
  let!(:task_001) { create(:task, title: 'Task Order 001') }
  let!(:task_002) { create(:task, title: 'Task Order 002') }

  scenario 'verify order & timestamp' do
    visit tasks_path
    expect(page.text.index('Task Order 001')).to be < page.text.index('Task Order 002')
    expect(task_001.created_at).to be < task_002.created_at
  end
end
