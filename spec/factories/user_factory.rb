Factory.define(:user) do |f|
  f.first_name { Random.firstname }
  f.last_name { Random.lastname }
  f.login { |u| "#{u.first_name.first}_#{u.last_name}_#{Random.number(1_000)}".downcase }
  f.password { "pos123" }
  f.password_confirmation { "pos123" }
end

Factory.define(:admin_user, :parent => :user) do |f|
  f.admin { true }
end
