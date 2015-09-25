require 'rails_helper'

describe 'Teams' do
  let!(:team) { create(:team) }

  describe 'List of teams' do
    context 'with teams' do
      before { visit teams_path }
      it { expect(page).to have_content('All the teams') }
      it { expect(page).to have_content(team.name) }
    end

    context 'without teams' do
      before do
        team.destroy
        visit teams_path
      end
      it { expect(page).to have_content('There are no teams') }
    end
  end

  describe 'Create a new team' do
    context 'with valid info' do
      let!(:mutant) { create(:mutant) }
      context 'with mutants' do
        before do
          visit new_team_path
          fill_in 'team_name', with: team.name
          fill_in 'team_description', with: team.description
          find(:css, "#mutant_ids").set(true)
        end

        it { expect { click_button 'Save' }.to change(Team, :count).by(1) } 
        it { expect { click_button 'Save' }.to change(MutantTeam, :count).by(1) }
        it 'have alert' do 
          click_button 'Save'
          expect(page).to have_selector('div.alert')
        end
      end

      context 'without mutants' do
        before do
          visit new_team_path
          fill_in 'team_name', with: team.name
          fill_in 'team_description', with: team.description
        end

        it { expect { click_button 'Save' }.to change(Team, :count).by(1) } 
        it { expect { click_button 'Save' }.to change(MutantTeam, :count).by(0) }
        it 'have alert' do 
          click_button 'Save'
          expect(page).to have_selector('div.alert')
        end
      end
    end  

    context 'with invalid info' do
      before do
        visit new_team_path
        fill_in 'team_name', with: team.name
      end

      it { expect { click_button 'Save' }.to change(Team, :count).by(0) } 
      it 'have errors' do 
        click_button 'Save'
        expect(page).to have_selector('div.errors')
      end      
    end
  end

  describe 'Update a team' do
    context 'with valid info' do
      let!(:new_name) { team.name + "_new" }
      before do
        visit edit_team_path(team)
        fill_in 'team_name', with: new_name
        click_button 'Save'
      end

      it { expect(team.reload.name).to eq(new_name) } 
      it { expect(page).to have_selector('div.alert') }
    end

    context 'with invalid info' do
      let!(:new_name) { '' }
      let!(:old_name) { team.name }
      before do
        visit edit_team_path(team)
        fill_in 'team_name', with: new_name
        click_button 'Save'
      end

      it { expect(team.reload.name).to eq(old_name) } 
      it { expect(page).to have_selector('div.errors') }
    end
  end

  describe 'Delete a team' do
    before { visit teams_path }
      
    it { expect { click_on 'Delete' }.to change(Team, :count).by(-1) }
  end
end