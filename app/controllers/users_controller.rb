class UsersController < ApplicationController
  layout 'admin'
  def index
    list
    render('list')
  end

  def list
    @users = User.order("users.last_name ASC")
  end

  def list_photos
    @photos = Photo.where(:user_id => params[:id]).order("photos.date ASC")
    @user = User.where(:id => params[:id])
    logger.debug ("test test")
  end

#  def index
#    @users = User.all
#  end
#
  def show
    @user = User.find(params[:id])
  end

  def create
    logger.debug("params[:user_name]------ #{params[:user_name]}")
    logger.debug("===================================")
    logger.debug("#{params.inspect}")
    logger.debug("===================================")
    @user = User.new(params[:user])
    if @user.save
    redirect_to(:action => "index")
    ## render(:action => "list")
    else
    render("new")
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
    flash[:notice] = "User data has been updated"
    redirect_to(:action => 'index')
    else
    render('edit')
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
end
