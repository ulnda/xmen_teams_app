class Team < ActiveRecord::Base
  validates :name, :description, presence: true

  has_many :mutant_teams
  has_many :mutants, through: :mutant_teams

  has_many :team_tasks
  has_many :tasks, through: :team_tasks
end
