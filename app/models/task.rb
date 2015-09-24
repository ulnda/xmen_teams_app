class Task < ActiveRecord::Base
  validates :title, :description, presence: true
  has_many :team_tasks
  has_many :teams, through: :team_tasks
end
