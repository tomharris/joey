Factory.define(:customer) do |f|
  f.first_name { Random.firstname }
  f.last_name { Random.lastname }
  f.balance { Random.number(100_000) / 100.0 }
  f.note { Random.words(5) }
end
