# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Adminparam.create!(:point_get_feedback=>1,:point_get_pastexam=>1,:point_need_feedback=>0,:point_need_pastexam=>0)
User.create! :username => 'admin', :email => 'admin@gmail.com', :password => '12345678', :password_confirmation => '12345678' , :is_admin => 1, :nick_name => 'admin', :first_name => 'admin' , :last_name => 'admin'


