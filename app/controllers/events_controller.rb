class EventsController < ApplicationController
  def new
    logger.debug("Controller Photos/Action New")
    puts params.inspect
    @event = Event.new(:user_id => params[:user_id])
    @user = User.where(:id => params[:user_id])
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
end
