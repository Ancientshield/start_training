# frozen_string_literal: true

class Task < ApplicationRecord
  validates_presence_of :title, :state, :priority

  scope :order_by_time, ->(field) { field ? order("#{field.to_sym} ASC") : all }
  scope :order_by_priority, ->(order) { order ? order("degree #{order}") : all }

  belongs_to :users
  has_many :tag_lists
  has_many :tags, through: :tag_lists

  def task_tags
    tags.map(&:name)
  end

  def task_tags=(names)
    # binding.pry_remote
    self.tags = names.map do |n|
      Tag.where(name: n.strip).first_or_create! unless n.blank?
    end .compact!
  end

  enum state: { "#{I18n.t :pending}": 1, "#{I18n.t :processing}": 2, "#{I18n.t :finishing}": 3 }
  enum priority: { "#{I18n.t :low}": 1, "#{I18n.t :medium}": 2, "#{I18n.t :high}": 3 }
end
