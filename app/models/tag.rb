# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :task
  has_many :tag_lists
  has_many :tasks, through: :tag_lists, dependent: :destroy
end
