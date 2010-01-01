# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

User.create do |u|
  u.login = "admin"
  u.first_name = "Admin"
  u.last_name = "User"
  u.password = "posadmin"
  u.password_confirmation = "posadmin"
  u.admin = true
end

User.create do |u|
  u.login = "cashier"
  u.first_name = "Cashier"
  u.last_name = "User"
  u.password = "poscashier"
  u.password_confirmation = "poscashier"
  u.admin = false
end
