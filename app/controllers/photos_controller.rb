class PhotosController < ApplicationController
  layout 'public'
  def index
    list
    render('list')
  end
  def list
    @photos = Photo.where(:user_id => params[:id]).order("photos.date ASC")
    @user = User.where(:id => params[:id]) 
    logger.debug ("test test") 
  end
  def new
    @photo = Photo.new(:user_id => params[:user_id])
    # @photo.user_id = :user_id
    @user = User.where(:id => params[:user_id])
  end
  def create
    @photo = Photo.new(params[:photo])
    logger.debug "The object is #{@photo}"
    if @photo.save
      redirect_to(:action => "list", :user_id => @photo.user_id)
    else
      render("new")
    end
  end
  
end
