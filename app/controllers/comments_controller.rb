class CommentsController < ApplicationController
  def new
    logger.debug("===================================")
    logger.debug("Controller PhotoComments/Action New")
    logger.debug("===================================")
    logger.debug("object #{@user.inspect}")
    logger.debug("===================================")
    puts params.inspect
    logger.debug("===================================")
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new(:photo_id => params[:photo_id])
    
  end

  def create
    logger.debug("===================================")
    logger.debug("Controller PhotoComments/Action New")
    logger.debug("===================================")
    logger.debug("object #{@user.inspect}")
    logger.debug("===================================")
    puts params.inspect
    logger.debug("===================================")
    @comment = @photo.comments.create(params[:comment])
    if @comment.save
    redirect_to(:controller => "users", :action => "list_photos", :user_id => @photo.user_id)
    else
    render("new")
    end
  end
end
