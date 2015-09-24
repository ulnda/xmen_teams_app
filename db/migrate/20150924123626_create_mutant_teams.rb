class CreateMutantTeams < ActiveRecord::Migration
  def change
    create_table :mutant_teams do |t|
      t.references :mutant, index: true
      t.references :team, index: true

      t.timestamps
    end

    add_index "mutant_teams", ["mutant_id", "team_id"], name: "index_mutant_teams_on_mutant_and_team", unique: true
  end
end
