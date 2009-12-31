Factory.define(:inventory_item) do |f|
  f.name { Random.words(2) }
  f.price { Random.number(10_000) / 100.0 }
end
