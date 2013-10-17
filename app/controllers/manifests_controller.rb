class ManifestsController < ApplicationController
  def index
    @manifests = Manifest.all
  end

  def new
    @manifest = Manifest.new
  end

  def create
    @manifest = Manifest.new(manifest_params)

    if @manifest.save
      flash[:notice] = "Manifest was successfully added."
      redirect_to manifests_path
    else
      flash[:alert] = "Manifest could not be saved."
      render :new
    end
  end

  def show
    @manifest = Manifest.find(params[:id])
  end

  def edit
    @manifest = Manifest.find(params[:id])
  end

  def update
    @manifest = Manifest.find(params[:id])
    if @manifest.update_attributes(manifest_params)
      flash[:notice] = "Project was successfully updated."
      redirect_to @manifest
    else
      flash[:alert] = "Project could not be saved."
      render :edit
    end
  end

  def destroy
    Manifest.find(params[:id]).destroy
    redirect_to manifests_path
  end

  private

  def manifest_params
    params[:manifest].permit(:title, :body)
  end
end
