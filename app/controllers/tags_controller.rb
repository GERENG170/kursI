class TagsController < ApplicationController

    def index
        @tag = Tag.all
      end

      def show
        @tag = Tag.find_by(name: params[:id])
        @items = @tag.items
        end
     
    private
    def tag_params
      params.require(:tag).permit(:name)
    end
end
