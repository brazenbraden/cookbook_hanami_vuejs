# frozen_string_literal: true

module Seeds
  module Initializer
    def initialize
      Dir["lib/cookbook/persistence/relations/*.rb"].each do |f|
        relation_name = File.basename(f, ".rb")
        relation = Hanami.app["persistence.rom"].relations[relation_name.to_sym]
        instance_variable_set("@#{relation_name}", relation)
      end
    end
  end

  def self.run!
    Dir["db/seeds/*.rb"].sort.each do |f|
      require_relative "seeds/#{File.basename(f)}"

      klass = self.eval(
        Dry::Inflector.new.classify(
          File.basename(f, ".rb")
        )
      )

      klass.send(:prepend, Initializer)
      klass.new.run
    end
  end
end
