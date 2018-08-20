  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
        
      units = ['cups', 'oz', 'tbs', 'ts']
      20.times do
        User.destroy_all
        20.times do
          user = User.new
          user.username = Faker::Name.first_name
          user.encrypted_password = 'example'
          user.email = "#{user.username[0]}@example.com".downcase
          user.save
        end
        puts "There are now #{User.count} users in the database."
        Recipe.destroy_all
        20.times.do
          User.all.each do |user|
             recipe = Recipe.new
             recipe.name = Faker::Food.dish
             recipe.user_id = user.id
             recipe.save
          end
          
          puts '20 recipes for each user now'
        end
        
        20.times.do 
          Recipe.all.each do |recipe| 
            3.times.do 
                ingredient = Ingredient.new
                ingredient.name = Faker::Food.ingredient
                ingredient.amount = rand(1..5)
                ingredient.units = units[rand(0..units.size-1)]
                ingredients.recipe_id = recipe.id
                ingredient.save
            end
          end
        end
        puts 'add ingredients to recipes'
