class ArtifactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  def index
    # write code (display list of all artifacts from db -- Assign to instance variable)
    @artifacts = Artifact.all
  end

  def show
    # write code to get a specific artifact from db (assign to instance variable)
    @artifact = Artifact.find(params[:id])
  end

  def new
  end

  def create
  end
end
