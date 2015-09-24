class Team < ActiveRecord::Base
  validates :name, :description, presence: true
  has_many :mutant_teams
  has_many :mutants, through: :mutant_teams
end
