require 'rails_helper'

describe 'Tasks' do
  let!(:task) { create(:task) }

  describe 'List of tasks' do
    context 'with tasks' do
      before { visit tasks_path }
      it { expect(page).to have_content('All the tasks') }
      it { expect(page).to have_content(task.title) }
    end

    context 'without tasks' do
      before do
        task.destroy
        visit tasks_path
      end
      it { expect(page).to have_content('There are no tasks') }
    end
  end

  describe 'Create a new task' do
    context 'with valid info' do
      let!(:team) { create(:team) }
      context 'with teams' do
        before do
          visit new_task_path
          fill_in 'task_title', with: task.title
          fill_in 'task_description', with: task.description
          find(:css, "#team_ids").set(true)
        end

        it { expect { click_button 'Save' }.to change(Task, :count).by(1) } 
        it { expect { click_button 'Save' }.to change(TeamTask, :count).by(1) }
        it 'have alert' do 
          click_button 'Save'
          expect(page).to have_selector('div.alert')
        end
      end

      context 'without tasks' do
        before do
          visit new_task_path
          fill_in 'task_title', with: task.title
          fill_in 'task_description', with: task.description
        end

        it { expect { click_button 'Save' }.to change(Task, :count).by(1) } 
        it { expect { click_button 'Save' }.to change(TeamTask, :count).by(0) }
        it 'have alert' do 
          click_button 'Save'
          expect(page).to have_selector('div.alert')
        end
      end
    end  

    context 'with invalid info' do
      before do
        visit new_task_path
        fill_in 'task_title', with: task.title
      end

      it { expect { click_button 'Save' }.to change(Task, :count).by(0) } 
      it 'have errors' do 
        click_button 'Save'
        expect(page).to have_selector('div.errors')
      end      
    end
  end

  describe 'Update a task' do
    context 'with valid info' do
      let!(:new_title) { task.title + "_new" }
      before do
        visit edit_task_path(task)
        fill_in 'task_title', with: new_title
        click_button 'Save'
      end

      it { expect(task.reload.title).to eq(new_title) } 
      it { expect(page).to have_selector('div.alert') }
    end

    context 'with invalid info' do
      let!(:new_title) { '' }
      let!(:old_title) { task.title }
      before do
        visit edit_task_path(task)
        fill_in 'task_title', with: new_title
        click_button 'Save'
      end

      it { expect(task.reload.title).to eq(old_title) } 
      it { expect(page).to have_selector('div.errors') }
    end
  end

  describe 'Delete a mutant' do
    before { visit tasks_path }
      
    it { expect { click_on 'Delete' }.to change(Task, :count).by(-1) }
  end
end