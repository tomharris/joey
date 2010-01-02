User.create do |u|
  u.login = "cashier"
  u.first_name = "Cashier"
  u.last_name = "User"
  u.password = "poscashier"
  u.password_confirmation = "poscashier"
  u.admin = false
end