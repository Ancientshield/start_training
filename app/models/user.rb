# frozen_string_literal: true

class User < ApplicationRecord
  before_destroy :check_admin_amount
  validates :name, :email, uniqueness: true
  validates :password, :authority, presence: :true
  has_secure_password
<<<<<<< HEAD
  has_many :tasks
  has_many :tags, dependent: :destroy
=======
  has_many :tasks, :tags, dependent: :destroy
>>>>>>> a5bf18c4... rebase master

  def to_param
    name
  end

  private

  def check_admin_amount
    throw(:abort) if User.where(authority: 'admin').count < 2
  end

  enum authority: { user: 0, admin: 1 }
end
