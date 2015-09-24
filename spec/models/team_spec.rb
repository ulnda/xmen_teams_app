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
end
