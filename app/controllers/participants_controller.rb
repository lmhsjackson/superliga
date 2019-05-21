class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]
  before_action :set_league

  def index
    @participants = @league.participants.order(score: :desc, rank: :desc)
  end

  def show; end

  def new
    @participant = Participant.new(league: @league)
  end

  def edit; end

  def create
    @participant = @league.participants.new(participant_params)
    flash[:notice] = "Participant was created successfully." if @participant.save
    respond_with(@league, @participant)
  end

  def update
    flash[:notice] = 'Participant was updated successfully.' if @participant.update(participant_params)
    respond_with(@league, @participant)
  end

  def destroy
   @participant.destroy
   respond_with(@league, @participant)
  end

  private

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def set_league
    @league = League.find(params[:league_id])
  end

  def participant_params
    params.require(:participant).permit(:rank, :player_id, :league_id)
  end
end
