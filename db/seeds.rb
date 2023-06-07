# frozen_string_literal: true

class Seeds
  def initialize
    Dir["lib/cookbook/persistence/relations/*.rb"].each do |f|
      relation_name = File.basename(f, ".rb")
      relation = Hanami.app["persistence.rom"].relations[relation_name.to_sym]
      instance_variable_set("@#{relation_name}", relation)
    end
  end

  def run
    c_id = @cookbooks.insert(name: "My Cookbook!")
    r_id = @recipes.insert(name: "Victoria Spunge Cake", blurb: "A lovely spunge cake", cookbook_id: c_id)
    i_id = @ingredients.insert(name: "Flour")
  end

  def self.run!
    new.run
  end
end
