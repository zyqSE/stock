# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "stock",
             email: "stock@admin.com",
             password:              "stockstock",
             password_confirmation: "stockstock",
             admin: true)

6.times do |n|
  name = "test#{n}"
  email = "#{name}@stock.com"
  password = "#{name}#{name}"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
