class User < ApplicationRecord
  self.inheritance_column = :role

  class << self
    def roles
      %w(Doctor Patient Staff)
    end
  end
end
