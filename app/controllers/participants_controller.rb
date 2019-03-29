class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]
  before_action :set_league

  # GET /participants
  # GET /participants.json
  def index
    @participants = Participant.all
  end

  # GET /participants/1
  # GET /participants/1.json
  def show; end

  # GET /participants/new
  def new
    @participant = Participant.new
  end

  # GET /participants/1/edit
  def edit; end

  # POST /participants
  # POST /participants.json
  def create
    @participant = @league.participants.new(participant_params)
    flash[:notice] = "Participant was created successfully." if @participant.save
    respond_with(@league, @participant)
  end

  # PATCH/PUT /participants/1
  # PATCH/PUT /participants/1.json
  def update
    flash[:notice] = 'Participant was created successfully.' if @participant.update(participant_params)
    respond_with(@league, @participant)
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
   @participant.destroy
   redirect_to league_participants_path(@league)
    # respond_with(@league, @participant)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_participant
    @participant = Participant.find(params[:id])
  end

  def set_league
    @league = League.find(params[:league_id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def participant_params
    params.require(:participant).permit(:rank, :player_id, :league_id)
  end
end
