task :setup_roles => :environment do
	#create roles
	Role.create(name: "admin")
	Role.create(name: "user")

	#create admin
	user = User.create(email: "admin@gmail.com", password: "secret123") 
	user.roles.push(Role.first)
	user.roles.push(Role.last)
end
