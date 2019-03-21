class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)
    flash[:notice] = "Match was created successfully." if @match.save
    respond_with @match

  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    flash[:notice] = "Match was created successfully." if @match.update(match_params)
    respond_with(@match)
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_with @match
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:kifu, :handicap, :winner, :victory_condition, :location_id, :league_id, :created_at, :updated_at, :black_player_id, :white_player_id)
    end
end
