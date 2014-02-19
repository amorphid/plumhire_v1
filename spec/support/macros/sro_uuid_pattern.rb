module SRO
  module Uuid
    def self.pattern
      /([a-z]|\d){8}-([a-z]|\d){4}-([a-z]|\d){4}-([a-z]|\d){4}-([a-z]|\d){12}/
    end

    def self.version5
      Version5UuidConstructor.new.response
    end
  end
end
