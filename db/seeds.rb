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
    first_name: "Cyrus",
    last_name: "Acla",
    skype_username: "miley.cyrus",
    whatsapp_number: "+449011106010",
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: Faker::Address.postcode,
    country: "Philippines",
    role: 1,
    remote_avatar_url: "https://i.imgur.com/8God3vt.png"
  }
]

User.skip_callback(:create, :after, :add_default_avatar)
User.create!(user_attributes)

## Create 10 regular users that can create posts and replies ##

puts 'Creating users...'
avatar_array = ["https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=707b9c33066bf8808c934c8ab394dff6","https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=a72ca28288878f8404a795f39642a46f","https://images.unsplash.com/photo-1502378735452-bc7d86632805?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=aa3a807e1bbdfd4364d1f449eaa96d82","https://images.unsplash.com/photo-1476900966873-ab290e38e3f7?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=fe0976a79ece0ee8effca4cab4527ae2","https://images.unsplash.com/photo-1498529605908-f357a9af7bf5?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=047fade70e80ebb22ac8f09c04872c40","https://images.unsplash.com/photo-1500649297466-74794c70acfc?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=bfc3d05aa60acb5ef0e58c1ac5eb6463","https://images.unsplash.com/photo-1495147334217-fcb3445babd5?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=7dc81c222437ff6fed90bfb04c491d6f","https://images.unsplash.com/photo-1504347538039-a53f6ff0131d?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=ca7cc3097e24937904aadfe78b36780c","https://images.unsplash.com/photo-1498529381350-89c2e7ccc430?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=f6143f1f2142185de1e1e3d955f729ec","https://images.unsplash.com/photo-1510274332963-71d4e866fccf?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=52f6b3afdcff888c1291ded145aec40c"]

10.times do |i|
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
      role: 0,
      remote_avatar_url: avatar_array[i]

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
    category_array = q_api_response["results"][counter]["category"].split(": ")
    category_name = category_array.pop

    if Category.where(name:category_name).empty?
      category = Category.create!(name:category_name)
    else
      cats = Category.where(name:category_name)
      category = Category.find(cats.ids)
    end

    category = category.pop if category.class == Array

    question = HTMLEntities.new.decode(q_api_response["results"][counter]["question"]).gsub(/[\\"]/,'')

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




