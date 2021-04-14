class ProjectMember < ApplicationRecord
	belongs_to :project
	belongs_to :client
	belongs_to :developer

	attribute :email

	def assign_client
		check_for_client = Client.find_by(email: email)
		# check_for_client.blank? self.client = Client.invite!(email: email) : self.client = check_for_client
		self.client = if check_for_client.blank?
						Client.invite!(email: email)
					else
						check_for_client
					end
	end

	
end
