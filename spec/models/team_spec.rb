require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:team) { create(:team) }

  it { expect(team).to respond_to(:name) }
  it { expect(team).to respond_to(:description) }
  it { expect(team).to respond_to(:mutant_teams) }
  it { expect(team).to respond_to(:mutants) }

  it { expect(team).to be_valid }

  describe 'name validations' do
    describe 'presence validation' do
      before { team.name = nil }
      it { expect(team).not_to be_valid }  
    end
  end

  describe 'description validations' do
    describe 'presence validation' do
      before { team.description = nil }
      it { expect(team).not_to be_valid }  
    end
  end

  describe 'mutant_teams validations' do
    describe 'dependent destroy' do
      before { create(:mutant_team, team: team) }

      it { expect{ team.destroy }.to change(MutantTeam, :count).by(-1) }
    end
  end

  describe 'team_tasks validations' do
    describe 'dependent destroy' do
      before { create(:team_task, team: team) }

      it { expect{ team.destroy }.to change(TeamTask, :count).by(-1) }
    end
  end
end
