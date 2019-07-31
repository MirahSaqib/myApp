# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

m1 = Medicine.create(name: "Augmentin", sale_price: 400, quantity: 40, hospital_id: 78)
m1 = Medicine.create(name: "Panadol", sale_price: 20, quantity: 20, hospital_id: 78)
m1 = Medicine.create(name: "SurbexZ", sale_price: 200, quantity: 8, hospital_id: 78)