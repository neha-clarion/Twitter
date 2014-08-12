# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user1 = User.create!(email:'neha@gmail.com',password: '1234567890', password_confirmation: '1234567890')
user2 = User.create!(email:'priya@gmail.com',password: '1234567890', password_confirmation: '1234567890')
user3 = User.create!(email:'kiran@gmail.com',password: '1234567890', password_confirmation: '1234567890')
puts "******user created*******"

user1.profile.update_attributes(bio:'all is well', email:'neha@gmail.com', location:'Ahmedabad', mobile_number:'1234567890', name:'Neha', profile_name:'neha.ladva', website:'www.abc.com', user_id:user1.id, country:'india', carrier:'vodafone')
user2.profile.update_attributes(bio:'trust', email:'priya@gmail.com', location:'Ahmedabad', mobile_number:'1234567890', name:'Priya', profile_name:'priya.prajapati', website:'www.priya.com', user_id:user2.id, country:'india', carrier:'airtel')
user3.profile.update_attributes(bio:'for success work smart', email:'kiran@gmail.com', location:'Ahmedabad', mobile_number:'1234567890', name:'Kiran', profile_name:'kiran.prajapati', website:'www.kiran.com', user_id:user3.id, country:'india', carrier:'vodafone')
puts "******profile created*******"

post1 = Post.create!(blog:'Hi,Good Morning',user_id:user1.id)
post2 = Post.create!(blog:'Happy Friendship Day :)',user_id:user2.id)
post3 = Post.create!(blog:'Hi Guys...',user_id:user3.id)
puts "******post created*******"
