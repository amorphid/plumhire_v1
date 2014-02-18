module SRO
  module Uuid
    def self.pattern
      /([a-z]|\d){8}-([a-z]|\d){4}-([a-z]|\d){4}-([a-z]|\d){4}-([a-z]|\d){12}/
    end
  end
end
