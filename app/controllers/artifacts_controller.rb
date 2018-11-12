class ArtifactsController < ApplicationController
  before_action :set_artifact, except: [:index, :new, :create]

  def index
  end

  def show
  end

  def new
    @artifact = Artifact.new
  end

  def create
    @artifact = Artifact.new(artifact_params)

    if @artifact.save
      redirect_to @artifact
    else
      render :new
    end
  end

  private

  def set_artifact
    @artifact = Artifact.find(params[:id])
  end

  def artifact_params
    params.require(:artifact).permit(:name, :address, :phone_number, :category)
  end

end
