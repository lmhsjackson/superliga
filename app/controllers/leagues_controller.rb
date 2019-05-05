class LeaguesController < ApplicationController
  before_action :set_league, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /leagues
  # GET /leagues.json
  def index
    @leagues = League.all
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show
  end

  # GET /leagues/new
  def new
    @league = League.new(start_date: Date.today, end_date: Date.today + 4.weeks)
  end

  # GET /leagues/1/edit
  def edit
  end

  # POST /leagues
  # POST /leagues.json
  def create
    @league = League.new(league_params)
    flash[:notice] = "League was created successfully." if @league.save
    respond_with @league
  end

  # PATCH/PUT /leagues/1
  # PATCH/PUT /leagues/1.json
  def update
    flash[:notice] = "League was created successfully." if @league.update(league_params)
    respond_with(@league)
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def destroy
    @league.destroy
    respond_with(@league)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_league
    @league = League.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def league_params
    params.require(:league).permit(:name, :edition, :start_date, :end_date, :director_id)
  end
end
