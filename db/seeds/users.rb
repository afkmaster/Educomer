Role.create([
  { :name => 'banned' }, 
  { :name => 'registered' }, 
  { :name => 'score' },
  { :name => 'information' },
  { :name => 'allinfo' },
  { :name => 'admin'}
], :without_protection => true)
user = User.create! :name => 'User1', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name
user2 = User.create! :name => 'User2', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user2.name
user3 = User.create! :name => 'User3', :email => 'score@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user3.name
user4 = User.create! :name => 'User4', :email => 'information@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user4.name
user5 = User.create! :name => 'User5', :email => 'allinfo@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user5.name
user.add_role :admin
user3.add_role :score
user4.add_role :information
user5.add_role :allinfo
user.remove_role :registered
user3.remove_role :registered
user4.remove_role :registered
user5.remove_role :registered
