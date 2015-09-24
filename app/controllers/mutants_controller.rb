class MutantsController < ApplicationController
  def index
    @mutants = Mutant.all
  end

  def new
    @mutant = Mutant.new
  end

  def create
    @mutant = Mutant.new(mutant_params)
    if @mutant.save
      redirect_to mutants_path
    else
      render 'new'
    end 
  end

  private
    def mutant_params
      params.require(:mutant).permit(:name, :description)
    end
end
