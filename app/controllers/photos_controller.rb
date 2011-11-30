class PhotosController < ApplicationController
  layout 'public'
  def index
    list
    render('list')
  end
 # def list
 #   @photos = Photo.where(:user_id => params[:id]).order("photos.date ASC")
 #   @user = User.where(:id => params[:id]) 
 #   logger.debug ("test test") 
 # end
  def new
    logger.debug("Controller Photos/Action New") 
    puts params.inspect
    @photo = Photo.new(:user_id => params[:id])
    # @photo.user_id = :user_id
    @user = User.where(:id => params[:id])
  end
  def create
    logger.debug("Controller Photos/Action Create") 
    p params
    @photo = Photo.new(params[:photo])
    @photo.user_id = params[:user_id]
    logger.debug "The object is #{@photo.inspect}"
    if @photo.save
      redirect_to(:controller => "users", :action => "list_photos", :user_id => @photo.user_id)
    else
      render("new")
    end
  end
  
end
