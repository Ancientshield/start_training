# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :tag_lists
  has_many :tasks, through: :tag_lists
end
