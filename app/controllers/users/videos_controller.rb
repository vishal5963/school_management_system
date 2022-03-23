class Users::VideosController < ApplicationController
  before_action :set_users_video, only: %i[ show edit update destroy]

  # GET /users/videos or /users/videos.json
  def index
    @users_videos = Users::Video.all
  end

  # GET /users/videos/1 or /users/videos/1.json
  def show
  end

  # GET /users/videos/new
  def new
    @users_video = Users::Video.new
  end

  # GET /users/videos/1/edit
  def edit
  end

  # POST /users/videos or /users/videos.json
  def create
    @users_video = Users::Video.new(users_video_params)

    respond_to do |format|
      if @users_video.save
        format.html { redirect_to users_videos_path, notice: "Video was successfully created." }
        format.json { render :show, status: :created, location: @users_video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @users_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/videos/1 or /users/videos/1.json
  def update
    respond_to do |format|
      if @users_video.update(users_video_params)
        format.html { redirect_to users_video_url(@users_video), notice: "Video was successfully updated." }
        format.json { render :show, status: :ok, location: @users_video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @users_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/videos/1 or /users/videos/1.json
  def destroy
    @users_video.destroy

    respond_to do |format|
      format.html { redirect_to users_videos_url, notice: "Video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def download_video
    @users_video = Users::Video.find(params[:video_id])
    send_file(
      "#{Rails.root}/public/#{@users_video.video.url.split('?')[0]}"
    )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_video
      @users_video = Users::Video.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def users_video_params
      params.require(:users_video).permit(:user_id, :is_deleted, :is_downloadable, :video)
    end
end
