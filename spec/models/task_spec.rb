# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  # it 'Valid with a task title' do
  #   task = Task.new(
  #     title: 'My first task',
  #     content: 'this is the first task content'
  #   )
  #   expect(task).to be_valid
  # end
  it 'has a valid task' do
    expect(FactoryBot.build(:task)).to be_valid
  end

  it 'is invalid task without a title' do
    task = FactoryBot.build(:task, title: nil)
    task.valid?
    expect(task.errors[:title]).to include("can't be blank")
  end
end
