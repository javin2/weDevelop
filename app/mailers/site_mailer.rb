class SiteMailer < ApplicationMailer

	def new_invite(client, developer)
		@client = client
		@developer = developer
		mail(to: @client.email, subject: 'You have been invited to a new project on weDevelop!')
	end

end
