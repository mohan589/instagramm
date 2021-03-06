class PicsController < ApplicationController
  before_action :find_pic, only: [:show, :update, :destroy, :edit, :upvote]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def show
    @comment = @pic.comments.new
  end

  def new
    @pic = current_user.pics.build
  end

  def create
    @pic = current_user.pics.build(pic_params)
    if @pic.save
      redirect_to @pic, notice: 'Successfully created pic'
    else
      render 'new'
    end
  end
  
  def user_pics
    @user = User.find(params[:id])
    @pics = @user.pics
  end

  def edit

  end

  def update
    if @pic.edit(pic_params)
      redirect_to @pic, notice: 'Contgrats pic was udpated'
    else
      render 'edit'
    end
  end

  def destroy
    @pic.destroy
    redirect_to root_path
  end

  def upvote
    @pic.upvote_by current_user
    redirect_to :back
  end

  private
  def pic_params
    params.require(:pic).permit(:title, :description, :user_id, :image)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end
end
