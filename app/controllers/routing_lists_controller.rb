class RoutingListsController < ApplicationController
  before_action :set_routing_list, only: [:show, :edit, :update, :destroy]

  # GET /routing_lists
  # GET /routing_lists.json
  def index
    @routing_lists = RoutingList.all
  end

  # GET /routing_lists/1
  # GET /routing_lists/1.json
  def show
  end

  # GET /routing_lists/new
  def new
    @routing_list = RoutingList.new
  end

  # GET /routing_lists/1/edit
  def edit
  end

  # POST /routing_lists
  # POST /routing_lists.json
  def create
    @routing_list = RoutingList.new(routing_list_params)

    result = RoutingListsService.create(@routing_list)

    respond_to do |format|
      if result
        format.html { redirect_to @routing_list, notice: 'Routing list was successfully created.' }
        format.json { render :show, status: :created, location: @routing_list }
      else
        format.html { render :new }
        format.json { render json: @routing_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routing_lists/1
  # PATCH/PUT /routing_lists/1.json
  def update
    respond_to do |format|
      if @routing_list.update(routing_list_params)
        format.html { redirect_to @routing_list, notice: 'Routing list was successfully updated.' }
        format.json { render :show, status: :ok, location: @routing_list }
      else
        format.html { render :edit }
        format.json { render json: @routing_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routing_lists/1
  # DELETE /routing_lists/1.json
  def destroy
    @routing_list.destroy
    respond_to do |format|
      format.html { redirect_to routing_lists_url, notice: 'Routing list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_routing_list
      @routing_list = RoutingList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def routing_list_params
      params.require(:routing_list).permit(:delivery_date, :delivery_shift, :driver_id, :first_step_id)
    end
end
