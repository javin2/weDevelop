class Developer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include DeviseInvitable::Inviter

	has_many :project_members
	has_many :clients, :through => :project_members
	has_many :projects
end
