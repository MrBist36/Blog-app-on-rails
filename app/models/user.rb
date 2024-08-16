class User < ApplicationRecord
  belongs_to :organization
  
  has_many :memberships
  has_many :organizations, through: :memberships
  has_many :articles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
