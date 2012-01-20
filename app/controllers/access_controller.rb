class AccessController < ApplicationController
 # layout 'admin'
 # before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]
 # def index
 #   menu
 #   render('menu')
 # end
  #def login
    # login form
  #end
 # def attempt_login
 #   logger.debug("params[:user_name]------ #{params[:user_name]}")
 #   logger.debug("===================================")
 #   logger.debug("#{params.inspect}")
 #   logger.debug("===================================")
 #   ## logger.debug("object #{@user.inspect}")
 #   authorized_user = User.authenticate(params[:user_name],params[:password])
 #   if authorized_user
 #     session[:user_id] = authorized_user.id
 #     session[:user_name] = authorized_user.user_name
 #     flash[:notice] = "You are logged in"
 #     redirect_to(:controller => 'users') ## , :action => 'list' )
 #   else
 #     flash[:notice] = "Invalid username/password combination."
 #     redirect_to(:action => 'login')
 #   end
 # end
  #def logout
  #    session[:user_id] = nil
  #    session[:user_name] = nil
  #    flash[:notice] = "You have been logged out."
  #    redirect_to(:action => 'login')
  #end
end