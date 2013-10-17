class ChecklistsController < ApplicationController

  before_action :load_manifest

  def index
    @checklists = @manifest.checklists.all
  end

  def new
    @checklist = @manifest.checklists.new
  end

  def create
    @checklist = @manifest.checklists.new(checklist_params)

    if @checklist.save
      flash[:notice] = "Checklist was successfully added."
      redirect_to new_manifest_checklist_path
    else
      flash[:alert] = "Checklist could not be saved."
      render :new
    end
  end

  def show
    @checklist = @manifest.checklists.find(params[:id])
  end

  def edit
    @checklist = @manifest.checklists.find(params[:id])
  end

  def update
    @checklist = @manifest.checklists.find(params[:id])
    if @checklist.update_attributes(checklist_params)
      flash[:notice] = "Project was successfully updated."
      redirect_to [@manifest, @checklist]
    else
      flash[:alert] = "Project could not be saved."
      render :edit
    end
  end

  def destroy
    @checklist = @manifest.checklists.find(params[:id]).destroy
    @checklist.destroy
    redirect_to manifest_checklists_path(@manifest)
  end

private

  def checklist_params
    params.require(:checklist).permit(:step)
  end

  def load_manifest
    @manifest = Manifest.find(params[:manifest_id])
  end
end

