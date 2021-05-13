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

	def notify_client_new_message(client, developer, project)
		@client = client
		@developer = developer
		@project = project
		mail(to: @client.email, subject: 'You have a new message from a developer on one of your projects at weDevelop!')
	end

	def notify_developer_new_message(client, developer, project)
		@client = client
		@developer = developer
		@project = project
		mail(to: @developer.email, subject: 'You have a new message from a developer on one of your projects at weDevelop!')
	end


end
