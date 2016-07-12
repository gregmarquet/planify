# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  Category.new(name: 'Fitness and Body')
  Category.new(name: 'Mind and Soul')
  Category.new(name: 'Love')
  Category.new(name: 'Friends and Family')
  Category.new(name: 'Career')
  Category.new(name: 'Finance')
  Category.new(name: 'Personal Growth')