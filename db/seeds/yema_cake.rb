# frozen_string_literal: true

require "pry"

module Seeds
  class YemaCake
    def run
      cookbook_id = create_cookbook
      recipe_id = create_recipe(cookbook_id)
      create_steps(recipe_id)
      create_ingredients(recipe_id)
    end

    private

    def create_cookbook
      @cookbooks.insert(name: "Baking")
    end

    def create_recipe(cookbook_id)
      @recipes.insert(
        name: "Yema cake",
        blurb: "Filipino cake yum yum",
        duration: 2 * 60 * 60,
        cookbook_id: cookbook_id
      )
    end

    def create_steps(recipe_id)
      [
        {
          position: 1,
          description: "Make the batter"
        },
        {
          position: 2,
          description: "Bake it in the oven for 40 minutes at 200 degrees celcius"
        },
        {
          position: 3,
          description: "Create the yema topping"
        },
        {
          position: 4,
          description: "Add the yema topping to the cooled sponges once baked"
        },
        {
          position: 5,
          description: "Top with grated cheddar and serve"
        }
      ].each { |step| @steps.insert(step.merge(recipe_id: recipe_id)) }
    end

    def create_ingredients(recipe_id)
      [
        {
          name: "Flour",
          calories: 10,
          price: 2.5,
          available: 1000,
          type_id: @ingredient_types.first_or_create(name: "Dry")[:id]
        },
        {
          name: "Sugar",
          calories: 100,
          price: 1.3,
          available: 2000,
          type_id: @ingredient_types.first_or_create(name: "Dry")[:id]
        },
        {
          name: "Eggs",
          calories: 50,
          price: 5.35,
          available: 8,
          type_id: @ingredient_types.first_or_create(name: "Eggs or Dairy")[:id]
        },
        {
          name: "Cream Cheese",
          calories: 80,
          price: 4.5,
          available: 350,
          type_id: @ingredient_types.first_or_create(name: "Eggs or Dairy")[:id]
        },
        {
          name: "Cheddar Cheese",
          calories: 50,
          price: 3.80,
          available: 400,
          type_id: @ingredient_types.first_or_create(name: "Eggs or Dairy")[:id]
        }
      ].each do |ingredient|
          ingredient_id = @ingredients.insert(ingredient)
          @recipe_ingredients.insert(
            recipe_id: recipe_id,
            ingredient_id: ingredient_id,
            amount: (ingredient[:available] / 3)
          )
        end
    end
  end
end
