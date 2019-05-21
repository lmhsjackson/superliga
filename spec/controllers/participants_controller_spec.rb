require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do
  let(:league) { create :league }
  let(:player) { create :player }
  let(:valid_attributes) {
    { rank: '3k', player_id: player.id, league_id: league.id }
  }

  let(:invalid_attributes) {
    { rank: 'NOT_Right', player_id: player.id, league_id: league.id }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Participant.create! valid_attributes
      get :index, params: { league_id: league.id }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      participant = Participant.create! valid_attributes
      get :show, params: { league_id: league.id, id: participant.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { league_id: league.id }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      participant = Participant.create! valid_attributes
      get :edit, params: { league_id: league.id, id: participant.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Participant" do
        expect {
          post :create, params: { league_id: league.id, participant: valid_attributes}, session: valid_session
        }.to change(Participant, :count).by(1)
      end

      it "redirects to the created participant" do
        post :create, params: { league_id: league.id, participant: valid_attributes}, session: valid_session
        expect(response).to redirect_to league_participant_path(league, Participant.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { league_id: league.id, participant: invalid_attributes}, session: valid_session
        expect(response).to redirect_to(league_participant_path(assigns(:league), assigns(:participant)))
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
         { rank: '5D' }
      }

      it "updates the requested participant" do
        participant = Participant.create! valid_attributes
        put :update, params: { league_id: league.id, id: participant.to_param, participant: new_attributes}, session: valid_session
        participant.reload
        expect(participant.rank).to eq(new_attributes[:rank])
      end

      it "redirects to the participant" do
        participant = Participant.create! valid_attributes
        put :update, params: { league_id: league.id, id: participant.to_param, participant: valid_attributes}, session: valid_session
        expect(response).to redirect_to(league_participant_path(league, participant))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        participant = Participant.create! valid_attributes
        put :update, params: { league_id: league.id, id: participant.to_param, participant: invalid_attributes}, session: valid_session
        expect(response).to redirect_to(league_participant_path(league, participant))
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested participant" do
      participant = Participant.create! valid_attributes
      expect {
        delete :destroy, params: { league_id: league.id, id: participant.to_param}, session: valid_session
      }.to change(Participant, :count).by(-1)
    end

    it "redirects to the participants list" do
      participant = Participant.create! valid_attributes
      delete :destroy, params: { league_id: league.id, id: participant.to_param}, session: valid_session
      expect(response).to redirect_to(league_participants_url(league))
    end
  end
end
