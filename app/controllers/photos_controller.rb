class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destory] 

  respond_to :html

  def index
    @photos = Photo.all
    respond_with(@photos)
  end

  def show
    respond_with(@photo)
  end

  def new
    @photo = Photo.new
    respond_with(@photo)
  end

  def edit
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save
    respond_with(@photo)
  end

  def update
    @photo.update(photo_params)
    respond_with(@photo)
  end

  def destroy
 if current_user == nil || false
 flash[:notice] = "You need to be sign in"
  redirect_to new_user_session_path
else
    @photo.destroy
    respond_with(@photo)
  end
end
  private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:image, :title, :body)
    end
end
