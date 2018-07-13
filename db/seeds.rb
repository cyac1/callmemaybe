# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)



# require 'json'
# require 'open-uri'
# require 'nokogiri'
# require 'pry'
# # require_relative "url.rb"
# # require_relative "addresses.rb"

# ## Clean old database ##

# puts 'Cleaning database...'
# Review.destroy_all

# Call.destroy_all

# Reply.destroy_all

# Question.destroy_all

# Category.destroy_all
# User.destroy_all



# ## Importing puppy breeds ##

# # puts 'Creating breeds...'

# # breed_list = JSON.parse(open("https://dog.ceo/api/breeds/list/all").read)

# # breed_array = breed_list["message"].to_a


# ## Create an admin user that can create categories ##

# puts 'Creating admin...'

# user_attributes = [
#   { email: "callmemaybe@gmail.com",
#     password: "password",
#     password_confirmation: "password",
#     phone_number: "+3911556261912",
#     first_name: "Ben",
#     last_name: "Stuart",
#     skype_username: "test",
#     whatsapp_number: "+449011106010",
#     street: Faker::Address.street_address,
#     city: Faker::Address.city,
#     zipcode: Faker::Address.postcode,
#     country: "United Kingdom",
#     role: 1,
#     avatar: "assets/images/default_avatar.jpeg"
#   }
# ]

# User.create!(user_attributes)

# ## Create 10 regular users that can create posts and replies ##

# puts 'Creating users...'

# 10.times do
#   full_name_array = Faker::RickAndMorty.character.split
#   user_attributes = [

#     { email: Faker::Internet.email,
#       password: "password",
#       password_confirmation: "password",
#       phone_number: Faker::PhoneNumber.phone_number,
#       first_name: full_name_array[0],
#       last_name: full_name_array[1],
#       skype_username: Faker::Internet.user_name,
#       whatsapp_number: Faker::PhoneNumber.phone_number,
#       street: Faker::Address.street_address,
#       city: Faker::Address.city,
#       zipcode: Faker::Address.postcode,
#       country: Faker::Address.country,
#       role: 0
#     }
#   ]

#   User.create!(user_attributes)
# end

# # ## Import question data ##
# q_api_response = JSON.parse(open("https://opentdb.com/api.php?amount=55&type=multiple").read)
# #binding.pry



# ## Create questions for each user, adding categories ##

# puts 'Creating questions...'



# users = User.all


#   counter = 0
# users.each do |user|
#   5.times do

#     difficulty = q_api_response["results"][counter]["difficulty"]
#     category_name = q_api_response["results"][counter]["category"]

#     if Category.where(name:category_name).empty?
#       category = Category.create!(name:category_name)
#     else
#       cats = Category.where(name:category_name)
#       category = Category.find(cats.ids)
#     end

#     category = category.pop if category.class == Array

#     question = q_api_response["results"][counter]["question"]
#     counter += 1

#     question_attributes =  { title: question,
#         description: Faker::RickAndMorty.quote,
#         user_id: user.id,
#         category_id: category.id }

#     Question.create(question_attributes)
#   end
# end

#   ## Create replies for each user's question##
# puts 'Creating replies...'

# all_questions = Question.all
# users.each do |user|
#   rand = rand(2..8)
#   reply_questions = all_questions.shuffle.take(rand)
#   final_qs = reply_questions.reject do |question|
#     question.user.id == user.id
#   end
#   if final_qs.length > 0
#     final_qs.each do |question|
#       reply_attributes = {
#       description: Faker::HowIMetYourMother.quote,
#       user_id: user.id,
#       question_id: question.id,
#       offer: rand(5.0...250.0).round(2)
#       }
#       Reply.create!(reply_attributes)
#     end
#   end
# end

#   ## Assign a call to two thirds of questions ##
# puts 'Creating calls...'

# all_questions.each do |q|
#   rand = rand(0..2)
#   if rand > 0 && q.replies.length > 0
#     reply = q.replies.sample
#     call_attributes = {
#     datetime: (1..500).to_a.sample.days.ago,
#     question_id: q.id,
#     reply_id: reply.id,
#     price: reply.offer,
#     call_status: rand(0..1)
#     }
#     Call.create!(call_attributes)
#   end
# end

#   ## Assign a call to two thirds of questions ##
# puts 'creating reviews..'

# calls = Call.all

# calls.each do |call|
#   asker = call.question.user
#   respondent = call.reply.user
#   user_array = [asker, respondent]

#   user_array.each do |user|
#     review_attributes = {
#     description: Faker::RickAndMorty.quote,
#     rating: rand(1..5),
#     user_id: user.id,
#     call_id: call.id,
#     }
#     Review.create!(review_attributes)
#   end
# end

# # users.reject do |user|
# #   user.id ==
# # end


# # description: nil
# # reply_status: nil
# # user_id: nil
# # question_id: nil
# # offer_cents: 0



# # {"response_code":0,
# #   "results":[{
# #     "category":"History",
# #     "type":"multiple",
# #     "difficulty":"hard",
# #     "question":"Pianist Fr&eacute;d&eacute;ric Chopin was a composer of which musical era?",
# #     "correct_answer":"Romantic",
# #     "incorrect_answers":["Classic","Baroque","Renaissance"]}]}

require 'json'
require 'open-uri'
require 'nokogiri'
# require_relative "url.rb"
# require_relative "addresses.rb"

## Clean old database ##

puts 'Cleaning database...'
Review.destroy_all

Call.destroy_all

Reply.destroy_all

Question.destroy_all

Category.destroy_all
User.destroy_all



## Importing puppy breeds ##

# puts 'Creating breeds...'

# breed_list = JSON.parse(open("https://dog.ceo/api/breeds/list/all").read)

# breed_array = breed_list["message"].to_a


## Create an admin user that can create categories ##

puts 'Creating admin...'

user_attributes = [
  { email: "callmemaybe@gmail.com",
    password: "password",
    password_confirmation: "password",
    phone_number: "+3911556261912",
    first_name: "Ben",
    last_name: "Stuart",
    skype_username: "test",
    whatsapp_number: "+449011106010",
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: Faker::Address.postcode,
    country: "United Kingdom",
    role: 1,
  }
]

User.create!(user_attributes)

## Create 10 regular users that can create posts and replies ##

puts 'Creating users...'

10.times do
  full_name_array = Faker::RickAndMorty.character.split
  user_attributes = [

    { email: Faker::Internet.email,
      password: "password",
      password_confirmation: "password",
      phone_number: Faker::PhoneNumber.phone_number,
      first_name: full_name_array[0],
      last_name: full_name_array[1],
      skype_username: Faker::Internet.user_name,
      whatsapp_number: Faker::PhoneNumber.phone_number,
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      zipcode: Faker::Address.postcode,
      country: Faker::Address.country,
      role: 0
    }
  ]

  User.create!(user_attributes)
end

# ## Import question data ##
q_api_response = JSON.parse(open("https://opentdb.com/api.php?amount=50&type=multiple").read)
#binding.pry



## Create questions for each user, adding categories ##

puts 'Creating questions...'



users = User.all


  counter = 0
users.each do |user|
  5.times do
    break if counter == 50

    difficulty = q_api_response["results"][counter]["difficulty"]
    category_name = q_api_response["results"][counter]["category"]

    if Category.where(name:category_name).empty?
      category = Category.create!(name:category_name)
    else
      cats = Category.where(name:category_name)
      category = Category.find(cats.ids)
    end

    category = category.pop if category.class == Array

    question = q_api_response["results"][counter]["question"]
    counter += 1

    question_attributes =  { title: question,
        description: Faker::RickAndMorty.quote,
        user_id: user.id,
        category_id: category.id }

    Question.create(question_attributes)
  end
end

  ## Create replies for each user's question##
puts 'Creating replies...'

all_questions = Question.all
users.each do |user|
  rand = rand(2..8)
  reply_questions = all_questions.shuffle.take(rand)
  final_qs = reply_questions.reject do |question|
    question.user.id == user.id
  end
  if final_qs.length > 0
    final_qs.each do |question|
      reply_attributes = {
      description: Faker::HowIMetYourMother.quote,
      user_id: user.id,
      question_id: question.id,
      offer: rand(5.0...250.0).round(2)
      }
      Reply.create!(reply_attributes)
    end
  end
end

  ## Assign a call to two thirds of questions ##
puts 'Creating calls...'

all_questions.each do |q|
  rand = rand(0..2)
  if rand > 0 && q.replies.length > 0
    reply = q.replies.sample
    call_attributes = {
    datetime: (1..500).to_a.sample.days.ago,
    question_id: q.id,
    reply_id: reply.id,
    price: reply.offer,
    call_status: rand(0..1)
    }
    Call.create!(call_attributes)
  end
end

  ## Assign a call to two thirds of questions ##
puts 'creating reviews..'

calls = Call.all

calls.each do |call|
  asker = call.question.user
  respondent = call.reply.user
  user_array = [asker, respondent]

  user_array.each do |user|
    review_attributes = {
    description: Faker::StarWars.quote,
    rating: rand(1..5),
    user_id: user.id,
    call_id: call.id,
    }
    Review.create!(review_attributes)
  end
end




