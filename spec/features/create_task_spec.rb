# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.feature 'create task', type: :feature do
  scenario 'valid inputs' do
    visit login_path
    fill_in 'name', with: 'admin01'
    fill_in 'password', with: 'asdf1234'
    click_on 'commit'
    visit new_task_path
    fill_in (I18n.t :task_title).to_s, with: 'Feature Test 001'
    click_on (I18n.t :sure).to_s
    visit tasks_path
    expect(page).to have_content('Feature Test 001')
    expect(Task.last.title).to eq 'Feature Test 001'
  end

  scenario 'invalid inputs' do
    visit login_path
    fill_in 'name', with: 'admin01'
    fill_in 'password', with: 'asdf1234'
    click_on 'commit'
    visit new_task_path
    fill_in (I18n.t :task_title).to_s, with: ''
    click_on (I18n.t :sure).to_s
    expect(page).to have_content((I18n.t :cant_be_blank).to_s)
  end
end
