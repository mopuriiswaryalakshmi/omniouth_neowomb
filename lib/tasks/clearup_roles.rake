task :clearup_roles => :environment do 
	Role.delete_all
	User.delete_all
	Permission.delete_all
end