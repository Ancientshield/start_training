# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "my title_0#{n}" }
    sequence(:content) { |n| "my content_0#{n}" }
  end
end
