# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'Valid with a task title' do
    task = Task.new(
      title: 'My first task',
      content: 'this is the first task content'
    )
    expect(task).to be_valid
  end
end
