class SubsController < ApplicationController
  before_action :is_mod?, only: [:edit, :update]
  
  def new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id 
    if @sub.save 
      redirect_to sub_url(@sub)
    else 
      flash.now[:errors] = @sub.errors.full_messages 
      render :new 
    end 
  end

  def index
    @subs = Sub.all 
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    
    if @sub && @sub.update(sub_params) #update_attributes ?? 
      redirect_to sub_url(@sub) 
    else 
      flash.now[:errors] = @sub.errors.full_messages 
      render :edit 
    end 
  end
  
  def is_mod?
    sub_forum = Sub.find(params[:id])
    
    unless current_user.id == sub_forum.user_id
      redirect_to new_session_url
    end
  end
  
   private 
  
  def sub_params 
    params.require(:sub).permit(:title, :description)
  end   
end
