# frozen_string_literal: true

class TagList < ApplicationRecord
  belongs_to :task
  belongs_to :tag
end
