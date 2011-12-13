class PhotosController < ApplicationController
  layout 'public'
  def index
    list
    render('list')
  end
  def new
    logger.debug("Controller Photos/Action New") 
    puts params.inspect
    @photo = Photo.new(:user_id => params[:user_id])
    @user = User.where(:id => params[:user_id])
  end
  def create
    logger.debug("===============================")
    logger.debug("Controller Photos/Action Create") 
    logger.debug("===============================")
    logger.debug "The object is #{@photo.inspect}"
    logger.debug("===============================")
    logger.debug "The object is #{@user.inspect}"
    logger.debug("===============================")
    p params
    logger.debug("===============================")
    @photo = Photo.new(params[:photo])
    @photo.user_id = params[:user_id]
    if @photo.save
      redirect_to(:controller => "users", :action => "list_photos", :user_id => @photo.user_id)
    else
      render("new")
    end
  end
  
end
