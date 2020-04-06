class DopsController < ApplicationController


  def index
    @dops = Dop.all
  end

  def show 
      @dop = Dop.find(params[:coll_id])
    end

    def create
      @coll = Coll.find(params[:coll_id])
        @dop = @coll.dops.new(dop_params)
        @dop.user_id = current_user.id
        @dop.save
        redirect_back(fallback_location: coll_path(@coll))
    end

      private
        def dop_params
          params.require(:dop).permit(:tfield, :name)
        end
    end
    

