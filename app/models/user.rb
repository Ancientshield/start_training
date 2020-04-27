# frozen_string_literal: true

class User < ApplicationRecord
  before_destroy :check_admin_amount
  validates :name, :email, :password, :authority, presence: true, uniqueness: true
  has_secure_password
  has_many :tasks, dependent: :destroy

  def to_param
    name
  end

  private

  def check_admin_amount
    throw(:abort) if User.where(authority: 'admin').count < 2
  end

  enum authority: { user: 0, admin: 1 }
end
