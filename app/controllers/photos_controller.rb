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
    @user = User.where(:id => params[:user_id]).first   
    if @user.photos << @photo
      redirect_to(:controller => "users", :action => "list_photos", :id => params[:user_id])
    else
      flash[:notice] = "Fail to upload photo"
      render("new")
    end
  end
  def new_event_photo
    @photo = Photo.new(:user_id => current_user.id)
    @event = Event.where(:id => params[:event_id]).first
    logger.debug ("new_event_photo method")
    render("new_event_photo")
  end  
  def create_event_photo
    @photo = Photo.new(params[:photo])
    @event = Event.where(:id => params[:event_id]).first   
    if @event.photos << @photo
      logger.debug ("create_event_photo is saved")
      redirect_to(:controller => "events", :action => "list_photos", :event_id => params[:event_id])
    else
      flash[:notice] = "Fail to upload photo"
      render("new_event_photo")
    end
  end  
end
