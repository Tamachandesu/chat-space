class Group < ApplicationRecord
  has_many :messages
  has_many :users, through: :group_users
  has_many :group_users, dependent: :destroy
  accepts_nested_attributes_for :users, allow_destroy: true

  validates :name, presence: true
end
