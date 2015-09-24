class Mutant < ActiveRecord::Base
  validates :name, :description, presence: true
end
