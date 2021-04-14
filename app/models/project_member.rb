class ProjectMember < ApplicationRecord
	belongs_to :project
	belongs_to :client
	belongs_to :developer


	
end
