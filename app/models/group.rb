class Group < ApplicationRecord
  belongs_to :account
  has_and_belongs_to_many :users
end
