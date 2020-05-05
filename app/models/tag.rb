# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :task
  belongs_to :user
  has_many :tag_lists, dependent: :destroy
end
