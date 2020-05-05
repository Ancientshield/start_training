# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :email, :password_digest, presence: true, uniqueness: true
  has_secure_password
  has_many :tasks

  def to_param
    name
  end
end
