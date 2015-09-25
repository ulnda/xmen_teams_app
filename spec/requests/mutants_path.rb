require 'rails_helper'

describe 'Mutants' do
  let!(:mutant) { create(:mutant) }

  describe 'List of mutants' do
    context 'with mutants' do
      before { visit mutants_path }
      it { expect(page).to have_content('All the mutants') }
      it { expect(page).to have_content(mutant.name) }
    end

    context 'without mutants' do
      before do
        mutant.destroy
        visit mutants_path
      end
      it { expect(page).to have_content('There are no mutants') }
    end
  end

  describe 'Create a new mutant' do
    context 'with valid info' do
      before do
        visit new_mutant_path
        fill_in 'mutant_name', with: mutant.name
        fill_in 'mutant_description', with: mutant.description
      end

      it { expect { click_button 'Save' }.to change(Mutant, :count).by(1) } 
      it 'have alert' do 
        click_button 'Save'
        expect(page).to have_selector('div.alert')
      end
    end  

    context 'with invalid info' do
      before do
        visit new_mutant_path
        fill_in 'mutant_name', with: mutant.name
      end

      it { expect { click_button 'Save' }.to change(Mutant, :count).by(0) } 
      it 'have errors' do 
        click_button 'Save'
        expect(page).to have_selector('div.errors')
      end      
    end
  end

  describe 'Update a mutant' do
    context 'with valid info' do
      let!(:new_name) { mutant.name + "_new" }
      before do
        visit edit_mutant_path(mutant)
        fill_in 'mutant_name', with: new_name
        click_button 'Save'
      end

      it { expect(mutant.reload.name).to eq(new_name) } 
      it { expect(page).to have_selector('div.alert') }
    end

    context 'with invalid info' do
      let!(:new_name) { '' }
      let!(:old_name) { mutant.name }
      before do
        visit edit_mutant_path(mutant)
        fill_in 'mutant_name', with: new_name
        click_button 'Save'
      end

      it { expect(mutant.reload.name).to eq(old_name) } 
      it { expect(page).to have_selector('div.errors') }
    end
  end

  describe 'Delete a mutant' do
    before { visit mutants_path }
      
    it { expect { click_on 'Delete' }.to change(Mutant, :count).by(-1) }
  end
end