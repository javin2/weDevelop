class ProjectMember < ApplicationRecord
	belongs_to :project
	belongs_to :client
	belongs_to :developer

	attr_accessor :skip_validations

	validates :client_id, presence: :true, unless: :skip_validations
	validates :developer_id, presence: :true
	validates :project_id, presence: :true
end
