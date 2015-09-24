class MutantsController < ApplicationController
  def index
    @mutants = Mutant.all
  end
end
