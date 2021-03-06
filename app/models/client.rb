class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :project_members
	has_many :developers, :through => :project_members
	has_many :projects, :through => :project_members

	mount_uploader :profile_photo, ProfilePhotoUploader
end
