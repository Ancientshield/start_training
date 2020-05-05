# frozen_string_literal: true

class Tag < ApplicationRecord
<<<<<<< HEAD
  has_many :tag_lists
  has_many :tasks, through: :tag_lists
=======
  belongs_to :tasks, :users
  has_many :tag_lists, dependent: :destroy
>>>>>>> a5bf18c4... rebase master
end
