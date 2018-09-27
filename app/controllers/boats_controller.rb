class BoatsController < ApplicationController
  before_action :authenticate_user!
  
    # GET /boats
    def index
      @boats = Boat.all
    end
  
    # GET /boats/1
    def show
      @boat = Boat.find(params[:id])
    end
  
    # GET /boats/new
    def new
      @boat = Boat.new
    end
  
    # GET /boats/1/edit
    def edit
      @boat = Boat.find(params[:id])
    end
  
    # POST /boats
    def create
      @boat = Boat.new(boat_params)
      @boat.user_id = current_user.id
      if @boat.save
        redirect_to "/"
      else
        render "/boats/new"
      end
    end
  
    # PATCH/PUT /boats/1
    def update
      @boat = Boat.find(params[:id])
      @boat.update(boat_params)
      if @boat.save
        redirect_to "/"
      else
        render "/boats/new"
      end
    end
  
    # DELETE /boats/1
    def destroy
      boat = Boat.find(params[:id])
      boat.destroy
      redirect_to boats_path
    end
  
    private
      # Only allow white list through, never trust parameters from the internet.
      def boat_params
        params.require(:boat).permit(:name, :max_containers, :location, :user_id, :image)
      end
  end