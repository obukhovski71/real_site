class PhotosController < ApplicationController
  layout 'public'
  ## before_filter :authenticate_user!
    before_filter :authenticate_user!, :except => [:index, :show]

  def new
    logger.debug("Controller Photos/Action New") 
    puts params.inspect
    @photo = Photo.new(:user_id => params[:user_id])
    @user = User.where(:id => params[:user_id])
  end
  def create
    logger.debug "The object is #{@user.inspect}"
    @photo = Photo.new(params[:photo])
  ##  @photo.user_id = params[:user_id]
    @user = User.where(:id => params[:user_id]).first   
    ## if @photo.save
    if @user.photos << @photo
      logger.debug ("photo is saved")
      redirect_to(:controller => "users", :action => "list_photos", :id => params[:user_id])
    else
      flash[:notice] = "Fail to upload photo"
      render("new")
    end
  end
  
end
