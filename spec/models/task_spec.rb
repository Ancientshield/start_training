# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:invalid_task) { build(:task, title: nil) }

  it 'should not valid' do
    expect(invalid_task).not_to be_valid
    expect(invalid_task.errors[:title]).to include((I18n.t :cant_be_blank).to_s)
  end
end
