class EventsController < ApplicationController
  layout 'admin'
  def new
    logger.debug("Controller Photos/Action New")
    puts params.inspect
    @event = Event.new
    @user = User.where(:id => params[:user_id])
    render("new")
  end

  def create
    logger.debug "The object is #{@user.inspect}"
    @event = Event.new(params[:event])
    ##  @photo.user_id = params[:user_id]
    @user = User.where(:id => params[:user_id]).first
    if @user.events << @event
      logger.debug ("photo is saved")
      redirect_to(:controller => "users", :action => "list_events", :id => params[:user_id])
    else
      flash[:notice] = "Fail to create event"
      render("new")
    end
  end
  def event_photos
    @event = Event.where(:id => params[:id]).first
    logger.debug("params event_id  #{params[:event_id]}")
    @photos =  @event.photos
  end
end
