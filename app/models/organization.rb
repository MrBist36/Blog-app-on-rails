class Organization < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  has_many :articles
  has_many :profiles
end
