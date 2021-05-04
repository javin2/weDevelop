class ProjectMember < ApplicationRecord
	belongs_to :project
	belongs_to :client
	belongs_to :developer

	attribute :email
	attribute :company_name
	attribute :phone
	attribute :rate
	attribute :first_name

	def assign_client
		check_for_client = Client.find_by(email: email)
		current_developer = Developer.find_by(id: developer_id)
		if !check_for_client.blank?
			SiteMailer.new_invite(check_for_client, current_developer).deliver_now
		end
		# check_for_client.blank? self.client = Client.invite!(email: email) : self.client = check_for_client
		self.client = if check_for_client.blank?
						Client.invite!(email: email, first_name: first_name, rate: rate, company_name: company_name, phone: phone)
					else
						check_for_client
					end
	end

	
end
