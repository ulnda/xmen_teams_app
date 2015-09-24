class Mutant < ActiveRecord::Base
  validates :name, :description, presence: true
  has_many :mutant_teams
  has_many :teams, through: :mutant_teams
end
