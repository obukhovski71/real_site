class UsersController < ApplicationController
  layout 'admin'
  def index
    list
    render('list')
  end

  def list
    @users = User.order("users.last_name ASC")
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(:action => "list")
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
    # Find object using form parameters
    @user = User.find(params[:id])
    # Update the object
    if @user.update_attributes(params[:user])
      # If update succeeds, redirect to the list action
      redirect_to(:action => 'show', :id => @user.id)
    else
    # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id]).delete
    redirect_to(:action => "list")
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to(:action => "list")
  end
end
