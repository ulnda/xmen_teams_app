require 'rails_helper'

RSpec.describe Mutant, type: :model do
  let(:mutant) { create(:mutant) }

  it { expect(mutant).to respond_to(:name) }
  it { expect(mutant).to respond_to(:description) }

  it { expect(mutant).to be_valid }

  describe 'name validations' do
    describe 'presence validation' do
      before { mutant.name = nil }
      it { expect(mutant).not_to be_valid }  
    end
  end

  describe 'description validations' do
    describe 'presence validation' do
      before { mutant.description = nil }
      it { expect(mutant).not_to be_valid }  
    end
  end
end
