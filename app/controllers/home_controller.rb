class HomeController < ApplicationController
  
  def index
    @colls = Coll.all
    @tags = Tag.all
    @items = Item.all.order(created_at: :desc).limit(4)
  end
end
