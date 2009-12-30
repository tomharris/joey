Factory.define(:sale) do |f|
  f.user { Factory.build(:user) }
  f.sub_total { Random.number(100_000) / 100.0 }
  f.tax { Random.number(100_000) / 100.0 }
end
