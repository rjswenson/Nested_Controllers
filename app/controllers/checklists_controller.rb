class ChecklistsController < ApplicationController
  class ManifestsController < ApplicationController
  def index
    @checklists = Checklist.all
  end

  def new
    @checklist = Checklist.new
  end

  def create
    @checklist = Checklist.new(checklist_params)

    if @checklist.save
      flash[:notice] = "Checklist was successfully added."
      redirect_to :new
    else
      flash[:alert] = "Checklist could not be saved."
      render :new
    end
  end

  def show
    @checklist = Checklist.find(params[:id])
  end

  def edit
    @checklist = Checklist.find(params[:id])
  end

  def update
    @checklist = Checklist.find(params[:id])
    if @checklist.update_attributes(checklist_params)
      flash[:notice] = "Project was successfully updated."
      redirect_to @checklist
    else
      flash[:alert] = "Project could not be saved."
      render :edit
    end
  end

  def destroy
    Checklist.find(params[:id]).destroy
    redirect_to checklists_path
  end

  private

  def Checklist_params
    params[:checklist].permit(:step)
  end
end

end
