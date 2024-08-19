class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_one_attached :profile_picture

  validates :full_name, :gender, :address, :date_of_birth, presence: true
  validates :user_id, :organization_id, presence: true
end
