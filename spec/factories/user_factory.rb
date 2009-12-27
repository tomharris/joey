Factory.define(:user) do |f|
  f.first_name { Random.firstname }
  f.last_name { Random.lastname }
  f.login { |u| "#{u.first_name.first}#{u.last_name}".downcase }
  f.password { "pos123" }
  f.password_confirmation { "pos123" }
end
