class MutantsController < ApplicationController
  MUTANT_CREATING_MESSAGE = "You've just created a new mutant."
  MUTANT_REMOVING_MESSAGE = "You've just removed a mutant."
  MUTANT_UPDATING_MESSAGE = "You've just updated a mutant."

  def index
    @mutants = Mutant.all
  end

  def new
    @mutant = Mutant.new
  end

  def create
    @mutant = Mutant.new(mutant_params)
    if @mutant.save
      redirect_to mutants_path, flash: { alert: MUTANT_CREATING_MESSAGE }
    else
      render 'new'
    end 
  end

  def edit
    @mutant = Mutant.find(params[:id])
  end

  def update
    @mutant = Mutant.find(params[:id])
    if @mutant.update(mutant_params)
      redirect_to mutants_path, flash: { alert: MUTANT_UPDATING_MESSAGE }
    else
      render 'edit'
    end
  end

  def destroy
    @mutant = Mutant.find(params[:id])
    @mutant.destroy!
    redirect_to mutants_path, flash: { alert: MUTANT_REMOVING_MESSAGE }
  end

  private
    def mutant_params
      params.require(:mutant).permit(:name, :description)
    end
end
