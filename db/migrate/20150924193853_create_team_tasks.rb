class CreateTeamTasks < ActiveRecord::Migration
  def change
    create_table :team_tasks do |t|
      t.references :team, index: true
      t.references :task, index: true

      t.timestamps
    end

    add_index "team_tasks", ["team_id", "task_id"], name: "index_team_tasks_on_team_and_task", unique: true
  end
end
