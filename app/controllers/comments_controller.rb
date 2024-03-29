class CommentsController < ApplicationController
  respond_to :js, :html
  def new
    logger.debug("object referral url #{request.env["HTTP_REFERER"].inspect}")
    logger.debug("===================================")
  ##  if request.env["HTTP_REFERER"] =~ /event_id=/
  ##    @referrer_page_list_photos_event = request.env["HTTP_REFERER"].match(/event_id=(\w)*/)[1].strip
  ##  else
  ##    @referrer_page_list_photos_event = false
  ##  end
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new(:photo_id => params[:photo_id])
    respond_to do |format|
    ##  format.html # show.html.erb
    ##  format.xml { render :xml => @project}  
      format.js  {render :layout => false} 
    end  
  end

  def create
    logger.debug("object :referrer_url:  #{request.env["HTTP_REFERER"]}")
    @comment = Comment.new(params[:comment])
    @comment.photo_id = params[:photo_id]
    @comment.user_id = current_user.id
    ## @comment.user_id = params[:user_id]
    debugger
    @photo = Photo.find(params[:photo_id])
    if  request.env["HTTP_REFERER"] && request.env["HTTP_REFERER"].include?("events")
      controller = "events"
      action = "event_photos"
      id = request.env["HTTP_REFERER"].split("/").last
      logger.debug("object id uri::path---  #{id}")
    else
      controller = "users"
      action = "user_photos"
      id = current_user.id
    end
    logger.debug("===================================")
    logger.debug("object params #{params.inspect}")
    logger.debug("===================================")
    if @photo.comments << @comment
      flash[:notice] = "Comment has been created"
      redirect_to(:controller => controller, :action => action, :id => id)
    else
      render("new")
    end
  end
  def delete
    logger.debug("===================================")
    logger.debug("object params #{params.inspect}")
    logger.debug("===================================")
    if  params[:referrer_page_list_photos_event]
      referer_controller = "events"
      id = params[:referrer_page_list_photos_event]
    else
      referer_controller = "users"
      id = current_user.id
    end
    Comment.find(params[:id]).delete
    flash[:notice] = "comment has been deleted"
    ## redirect_to(:controller => referer_controller, :action => "list_photos", :id => id)
    ## redirect_to(:controller => "users", :action => "list_photos", :id => params[:user_id])
    ## redirect_to(:controller => referer_controller, :action => "list_photos", :id => id)
    respond_to do |format|
    ##  format.html {redirect_to "users", :action => "list_photos", :id => params[:user_id]}
    ##  format.xml  {render :xml => @project}  
      format.js   {render :layout => false} 
    end  
  end
end
