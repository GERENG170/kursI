class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def show
    @tags = Tag.all
     @item = Item.find(params[:id])
     @comment = Comment.new
     @comments = @item.comments.order("adsa")
  end
    def create
        @coll = Coll.find(params[:coll_id])
        @item = @coll.items.create(item_params)
        redirect_to coll_path(@coll)
      end

      def destroy
        @coll = Coll.find(params[:coll_id])
        @item = @coll.items.find(params[:id])
        @item.destroy
        redirect_to coll_path(@coll)
      end
      
    
      private
        def item_params
          params.require(:item).permit(:title, :body, :all_tags, :image, :tag)
        end
    end

