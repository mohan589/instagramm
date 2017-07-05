class CommentsController < ApplicationController
    before_action :set_pic, only: [:create]
    
    def index
    end
    
    def new
        @comment = @pic.comments.build(comment_params)
    end
    
    def create
        @comment = @pic.comments.build(comment_params)
        @comment.user_id = current_user.id
        
        if @comment.save
            redirect_to :back
        else
            'new'
        end
    end
    
    def show
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:comments, :user_id, :pic_id)
    end
    
    def set_pic
        @pic = Pic.find(params[:pic_id])
    end
end
