class UsersController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!  ##, :except => [:index, :show]
  before_filter :check_for_cancel, :only => [:create, :edit_custom]
  def index
    list
    render('list')
  end

  def list
    @users = User.order("users.last_name ASC")
    @users.each do |u|
    ##  logger.debug("#{u.name}")
    end
  end

  def list_photos
    @user = User.where(:id => params[:id]).first
    User.connection.clear_query_cache
    @photos =  @user.photos
    debugger
    logger.debug ("test action => list_photos, controller => users_controller  #{@photos.inspect}")
  end
  def list_events
    @user = User.where(:id => params[:id]).first
    @events = @user.events
    ## logger.debug ("test action => list_events user: #{@user.inspect}")
  end  

  def create
    ## logger.debug("#{params.inspect}")
    @user = User.new(params[:user])
    if @user.save
    redirect_to(:action => "index")
    ## render(:action => "list")
    else
    render("new")
    end
  end

  def edit_custom
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def update
    ## logger.debug("#{params.inspect}")
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
    flash[:notice] = "User data has been updated"
    redirect_to(:action => 'index')
    else
      flash[:notice] = "Fail to update user"
      debugger
      render('edit_custom')
    end
  end
  
  def delete
    @user = User.find(params[:id]).delete
    redirect_to(:action => "index")
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to(:action => "index")
  end
  def check_for_cancel
     if params[:commit] && params[:commit].downcase == 'cancel'
       redirect_to(:action => "list")
     end
  end  
end
