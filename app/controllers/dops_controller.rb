class DopsController < ApplicationController
  before_action :set_coll
  
  def create
  @dop = @coll.dops.new(dop_params)
  @dop.user_id = current_user.id
  @dop.save
  end

  private
    def dop_params
      params.require(:dop).permit(:tfield, :name, :coll_id)
    end
    def set_coll
      @coll = Coll.find(params[:coll_id])
end
end


