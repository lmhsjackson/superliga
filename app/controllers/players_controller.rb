class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)
    flash[:notice] = "Player was created successfully." if @player.save
    respond_with @player
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    flash[:notice] = "Player was created successfully." if @player.update(player_params)
    respond_with(@player)
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_with(@player)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def player_params
    params.require(:player).permit(:name, :email, :rango)
  end
end
