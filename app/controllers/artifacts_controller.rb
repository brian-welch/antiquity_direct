class ArtifactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_artifact, only: [:show]

  def index
    # write code (display list of all artifacts from db -- Assign to instance variable)
    @artifact_types = ArtifactType.all.order(name: :asc)
    if params[:artifact_type_id].present?
      @artifacts = Artifact.where(artifact_type_id: params[:artifact_type_id])
    else
      @artifacts = Artifact.all
    end
  end

  def show
    # write code to get a specific artifact from db (assign to instance variable)
    @artifact = Artifact.find(params[:id])
    @booking = Booking.new
  end

  def new
    @artifact = Artifact.new
  end

  def create
    @artifact = Artifact.new(artifact_params)
    @artifact.user = current_user
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
    params.require(:artifact).permit(:name,
                                     :description,
                                     :price,
                                     :discount,
                                     :photo,
                                     :free_shipping,
                                     :cultural_origin_id,
                                     :time_period_id,
                                     :artifact_type_id,
                                     :condition_id)
  end
end
