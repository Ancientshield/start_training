# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

@state = []
@state = %w[pending processing finishing]

@priority = []
@priority = %w[high medium low]

User.create(name: 'admin', email: 'admin@gmail.com', password_digest: '$2a$12$2/xf31SGtJx69O2fNi11r.Y3kOV5riFTpolnWsH4uwkFD4RnAfDty')

# 10.times do
#   Task.create(
#     title: Faker::Games::Pokemon.location,
#     content: Faker::Games::WorldOfWarcraft.quote,
#     end_time: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 30),
#     state: @state[rand(0..2)],
#     priority: @priority[rand(0..2)],
#     degree: rand(1..3),
#     user_id: 1
#   )
# end
