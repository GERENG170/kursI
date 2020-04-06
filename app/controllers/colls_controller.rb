class CollsController < ApplicationController
  before_action :set_coll, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:show , :index]
  

  # GET /colls
  # GET /colls.json
  def index
    @colls = Coll.search(params[:search])
  end

  # GET /colls/1
  # GET /colls/1.json
  def show
   @dop = Dop.new
   @dops = @coll.dops.order("created_at DESC")
  end

  # GET /colls/new
  def new
    @coll = Coll.new
  end

  # GET /colls/1/edit
  def edit
  end

  # POST /colls
  # POST /colls.json
  def create
    @coll = Coll.new(coll_params)
    @coll.user_id = current_user.id

    respond_to do |format|
      if @coll.save
        format.html { redirect_to @coll, notice: 'Coll was successfully created.' }
        format.json { render :show, status: :created, location: @coll }
      else
        format.html { render :new }
        format.json { render json: @coll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colls/1
  # PATCH/PUT /colls/1.json
  def update
    respond_to do |format|
      if @coll.update(coll_params)
        format.html { redirect_to @coll, notice: 'Coll was successfully updated.' }
        format.json { render :show, status: :ok, location: @coll }
      else
        format.html { render :edit }
        format.json { render json: @coll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colls/1
  # DELETE /colls/1.json
  
  def destroy
    @coll.destroy
    respond_to do |format|
      format.html { redirect_to colls_url, notice: 'Coll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @coll.upvote_by current_user
    redirect_to root_path
  end

  def downvote
    @coll.downvote_by current_user
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coll
      @coll = Coll.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coll_params
      params.require(:coll).permit(:title, :body, :all_topics, :image)
    end
end
