# auto_register: false
# frozen_string_literal: true

module Cookbook
  class Repository < ROM::Repository::Root
    include Deps[container: "persistence.rom"]
  end
end
