require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { create(:task) }

  it { expect(task).to respond_to(:title) }
  it { expect(task).to respond_to(:description) }
  it { expect(task).to respond_to(:team_tasks) }
  it { expect(task).to respond_to(:teams) }

  it { expect(task).to be_valid }

  describe 'title validations' do
    describe 'presence validation' do
      before { task.title = nil }
      it { expect(task).not_to be_valid }  
    end
  end

  describe 'description validations' do
    describe 'presence validation' do
      before { task.description = nil }
      it { expect(task).not_to be_valid }  
    end
  end
end
