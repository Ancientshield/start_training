# frozen_string_literal: true

class Task < ApplicationRecord
  include AASM
  validates_presence_of :title

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

  # 建立一張 3高 2中 1低的表來join
  # aasm column: :priority do
  #   state :medium, initial: true
  #   state :high, :low
  # end
end
