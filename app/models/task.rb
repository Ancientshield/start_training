# frozen_string_literal: true

class Task < ApplicationRecord
  include AASM
  validates_presence_of :title

  scope :order_by_time, ->(field) { field ? order("#{field.to_sym} ASC") : all }
  scope :order_by_priority, ->(field) { field ? order("degree #{field}") : all }

  belongs_to :users

  aasm column: :state do
    state :pending, initial: true
    state :processing, :finishing

    event :procressed do
      transitions from: :pending, to: :processing
    end

    event :completed do
      transitions from: :processing, to: :finishing
    end
  end

  aasm column: :priority do
    state :medium, initial: true
    state :high, :low
  end

  enum degree: { low: 1, medium: 2, high: 3 }
end
