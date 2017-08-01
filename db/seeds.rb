# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Course.delete_all
Course.create name: "Day Pass", price: 65
Course.create name: "Full Time", price: 220
Course.create name: "Multi-day Pass", price: 110
