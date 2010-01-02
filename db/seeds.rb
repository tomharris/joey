# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Dir[File.expand_path(File.dirname(__FILE__)) + "/seeds/shared/*.rb"].each do |file|
  require file
end

#environment specific seeds
Dir[File.expand_path(File.dirname(__FILE__)) + "/seeds/#{RAILS_ENV}/*.rb"].each do |file|
  require file
end
