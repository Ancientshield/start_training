# frozen_string_literal: true

class Task < ApplicationRecord
  validates_presence_of :title

  scope :order_by_time, ->(field) { field ? order("#{field.to_sym} ASC") : all }
  scope :order_by_priority, ->(order) { order ? order("degree #{order}") : all }

  belongs_to :users

  enum state: { "#{I18n.t :pending}": 1, "#{I18n.t :processing}": 2, "#{I18n.t :finishing}": 3 }
  enum priority: { "#{I18n.t :low}": 1, "#{I18n.t :medium}": 2, "#{I18n.t :high}": 3 }
end
