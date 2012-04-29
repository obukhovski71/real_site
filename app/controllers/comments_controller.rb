class CommentsController < ApplicationController
  respond_to do |format|
    format.html # show.html.erb
    format.xml  { render :xml => @project }  
    format.js {render :layout => false} 
  end  
  def new
    logger.debug("===================================")
    logger.debug("Controller PhotoComments/Action New")
    logger.debug("===================================")
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
      format.xml  { render :xml => @project }  
      format.js {render :layout => false} 
    end  
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.photo_id = params[:photo_id]
    @comment.user_id = current_user.id
    ## @comment.user_id = params[:user_id]
    debugger
    @photo = Photo.find(params[:photo_id])
    ##  if @comment.save
    if  params[:referrer_page_list_photos_event]
      referer_controller = "events"
      id = params[:referrer_page_list_photos_event]
    else
      referer_controller = "users"
      id = current_user.id
    end
    logger.debug("===================================")
    logger.debug("object params #{params.inspect}")

    logger.debug("===================================")
    if @photo.comments << @comment
      flash[:notice] = "Comment has been created"
      redirect_to(:controller => referer_controller, :action => "list_photos", :id => id)
    else
      render("new")
    end
  end
end
