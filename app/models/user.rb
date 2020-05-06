# frozen_string_literal: true

class User < ApplicationRecord
  before_save { email.downcase! }
  before_destroy :check_admin_amount

  has_many :tasks, dependent: :destroy
  validates :name, length: { maximum: 50 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :password, :authority, presence: true
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
