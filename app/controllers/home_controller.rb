class HomeController < ApplicationController
  
  def index
    @colls = Coll.all
  end
end
