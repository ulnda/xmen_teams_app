class TeamTask < ActiveRecord::Base
  belongs_to :team
  belongs_to :task
end
