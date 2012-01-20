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
    logger.debug("======================================")
    logger.debug("Controller PhotoComments/Action Create")
    logger.debug("======================================")
    logger.debug("object user #{@user.inspect}")
    logger.debug("======================================")
    logger.debug("object photo #{@photo.inspect}")
    logger.debug("===================================")
    logger.debug("object params #{params.inspect}")
    logger.debug("===================================")
    @comment = Comment.new(params[:comment])
    @comment.photo_id = params[:photo_id]
    @comment.user_id = current_user.id
    ## @comment.user_id = params[:user_id]
    debugger
   ## @comment = @photo.comments.create(params[:comment])
   @photo = Photo.find(params[:photo_id])
    if @comment.save
      redirect_to(:controller => "users", :action => "list_photos", :id => @photo.user_id)
    else
      render("new")
    end
  end
end
