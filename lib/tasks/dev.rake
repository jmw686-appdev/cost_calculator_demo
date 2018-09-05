require "unitwise"
namespace :dev do
  desc "Add some dummy data to make it easier to develop"
  task prime: :environment do
    usernames = ["alice", "bob", "carol"]

    users = []
    units = ["oz", "pint", "cup", "oz fl", "tablespoon", "teaspoon"]
    usernames.each do |username|
      user = User.find_or_initialize_by(email: "#{username}@example.com")

      user.username = username
      user.password = "password"
      user.save

      users << user
    end

    puts "There are now #{User.count} users in the database."

    recipes = []

    users.each do |user|
      2.times do
        recipe = Recipe.new
        recipe.name = Faker::Food.dish
        recipe.user_id = user.id
        recipe.save
        recipes << recipe
      end
    end

    puts "There are now #{Recipe.count} recipes in the database."

    recipes.each do |r|
      2.times do
        i = Ingredient.new
        i.name = Faker::Food.ingredient
        # i.quantity = Unitwise(1, 'cup')
        i.quantity = rand(1..6)
        i.units = units[rand(0..units.size - 1)]
        i.recipe_id = r.id
        i.save
      end
    end

    puts "There are now #{Ingredient.count} ingredient in the database."
  end
end
