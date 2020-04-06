class CommentsController < ApplicationController
  before_action :set_item
  before_action :set_coll
    def create
        @comment = @item.comments.new(comment_params)
        @comment.user_id = current_user.id
        @comment.save    
    end

    def destroy 
      @comment = @item.comments.find(params[:id])

      @comment.destroy
    end
      private
        def comment_params
          params.require(:comment).permit(:body)
        end
        def set_item
          @item = Item.find(params[:item_id])
        end
        def set_coll
          @coll =Coll.find(@item.coll_id)
        end

    end

