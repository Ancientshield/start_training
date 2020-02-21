# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  # 不使用 FactoryBot.build 會報錯
  # undefined method `build' for #<RSpec::ExampleGroups::Task:0x00007faab6d8f6e0>
  let(:invalid_task) { FactoryBot.build(:task, title: nil) }

  it 'should not valid' do
    expect(invalid_task).not_to be_valid
    expect(invalid_task.errors[:title]).to include("can't be blank")
  end
end
