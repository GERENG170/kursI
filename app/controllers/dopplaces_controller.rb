class DopplacesController < ApplicationController
    def create
      @item = Item.find(params[:item_id])
        @dop = Dop.find(params[:dop_id])
        @dopplace = @item.dopplaces.create(dopplace_params)
        @dopplace.save



        def create
          @coll = Coll.find(params[:coll_id])
            @dop = @coll.dops.new(dop_params)
            @dop.user_id = current_user.id
            @dop.save
            redirect_back(fallback_location: coll_path(@coll))
        end
    end
    
      private
        def dopplace_params
          params.require(:dopplace).permit(:body)
        end
    end
