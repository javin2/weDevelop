class SiteMailer < ApplicationMailer

	def new_invite(client, developer)
		@client = client
		@developer = developer
		mail(to: @client.email, subject: 'You have been invited to a new project on weDevelop!')
	end

	def new_update(client, developer)
		@client = client
		@developer = developer
		mail(to: @client.email, subject: 'You have a new update on one of your projects at weDevelop!')
	end

end
