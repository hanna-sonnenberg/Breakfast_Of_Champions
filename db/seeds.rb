# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

puts "start time is #{Time.now}"
puts "----------------------------------"

Feedback.destroy_all
PostCategory.destroy_all
Post.destroy_all
User.destroy_all
Category.destroy_all

puts "creating user"

User.create(name: 'John Smith', username: 'John Smith', email: 'a@a.com', password: '654321')
User.create(first_name: 'Sam', last_name: 'Bam', user_name: 'Sam Bam', email: 'bb@a.com', password: '65432134')
User.create()





5.times do
  user = User.create (
    name: Faker::Name.name,
    email: Faker::Internet.email,
    username: Faker::Artist.name,
    biography: Faker::Lorem.paragraphs,
    experience: Faker::Lorem.paragraphs,
    location: Faker::Address.city
    password: "password",
    password_confirmation: "password"
  )
end





puts "creating categories"

CATEGORIES = ["Logo & identity", "App & web design", "Business & advertising", "Art & illustration", "Other" ]
CATEGORIES.each do |category|
  Category.create(name: category)
  end

puts "creating post and feedback"



10.times do
  post = Post.create(
    title: Faker::Company.catch_phrase,
    description: Faker::Quote.famous_last_words,
    user: User.all.sample,
    )

  1.times do

    feedback = Feedback.create(
      user: User.last,
      description: Faker::Quote.famous_last_words,
      post: post
      )
end
end

  Post.all.each do |post|
    PostCategory.create(
      category: Category.all.sample,
      post: post)
  end

puts "----------------------------------"
puts "#{Post.count} Posts created"
puts "#{User.count} Users created"
puts "#{Feedback.count} Feedback created"
puts "#{Category.count} Categories created"
puts "#{PostCategory.count} Post categories created"
puts "----------------------------------"

puts "end time is #{Time.now}"

