# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :tasks, :users
  has_many :tag_lists, dependent: :destroy
end
