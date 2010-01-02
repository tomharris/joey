User.create do |u|
  u.login = "admin"
  u.first_name = "Admin"
  u.last_name = "User"
  u.password = "posadmin"
  u.password_confirmation = "posadmin"
  u.admin = true
end
