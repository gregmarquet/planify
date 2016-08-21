# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean


  Category.create(name: 'Fitness and Body')
  Category.create(name: 'Mind and Soul')
  Category.create(name: 'Love')
  Category.create(name: 'Friends and Family')
  Category.create(name: 'Career')
  Category.create(name: 'Finance')
  Category.create(name: 'Personal Growth')

  5.times do |user|
    user = User.new_with_categories(username: Faker::Internet.user_name, email: Faker::Internet.email, password: '1234')
    user.save
  end

  150.times do |task|
    task = Task.new(title: Faker::Hipster.sentence)
    task.created_at = (rand*10).days.ago
    user_category = UserCategory.find_by({user_id: rand(1..5), category_id: rand(1..7)})
    task.user_category = user_category
    task.status = ['incomplete', 'completed', 'abandoned'].sample
    if task.status != "incomplete"
      task.modified_at = rand(task.created_at..Time.now)
    end
    task.save
  end

  