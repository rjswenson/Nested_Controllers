class ChecklistsController < ApplicationController
  class ManifestsController < ApplicationController

  before_filter :load_manifest

  def index
    @checklists = @manifest.checklists.all
  end

  def new
    @checklist = @manifest.checklists.new
  end

  def create
    @checklist = @manifest.checklists.new(params[:checklist])

    if @checklist.save
      flash[:notice] = "Checklist was successfully added."
      redirect_to [@manifest, @checklist]
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
    redirect_to checklists_path
  end

  private

    def checklist_params
      params[:checklist].permit(:step, :manifest_id)
    end

    def load_manifest
      @manifest = Manifest.find(params[:manifest_id])
      @manifests = Manifest.all
    end
  end
end
