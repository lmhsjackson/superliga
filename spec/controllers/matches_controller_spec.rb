require 'rails_helper'

RSpec.describe MatchesController, type: :controller do

  let(:white_player) { create :player }
  let(:black_player) { create :player }
  let(:league) { create :league }
  let(:location) { create :location }

  let(:valid_attributes) {
    { 'handicap' => '4', 'winner' => 'black', 'victory_condition' => 'resignation',
      'location_id' => location.id.to_s, 'league_id' => league.id.to_s,
      'black_player_id' => black_player.id.to_s, 'white_player_id' => white_player.id.to_s }
  }

  let(:invalid_attributes) {
    { 'handicap' => '4', 'winner' => 'black', 'victory_condition' => 'resignation',
      'location_id' => nil, 'league_id' => league.id.to_s,
      'black_player_id' => black_player.id.to_s, 'white_player_id' => white_player.id.to_s }
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Match.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      match = Match.create! valid_attributes
      get :show, params: {id: match.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      match = Match.create! valid_attributes
      get :edit, params: {id: match.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Match' do
        expect {
          post :create, params: {match: valid_attributes}, session: valid_session
        }.to change(Match, :count).by(1)
      end

      it 'redirects to the created match' do
        post :create, params: {match: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Match.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the \'new\' template)' do
        post :create, params: {match: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_handicap) { '8' }
      let(:new_attributes) { valid_attributes.merge 'handicap' => new_handicap }

      it 'updates the requested match' do
        match = Match.create! valid_attributes
        put :update, params: {id: match.to_param, match: new_attributes}, session: valid_session
        match.reload
        expect(match.handicap).to eq(new_handicap.to_i)
      end

      it 'redirects to the match' do
        match = Match.create! valid_attributes
        put :update, params: {id: match.to_param, match: valid_attributes}, session: valid_session
        expect(response).to redirect_to(match)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the \'edit\' template)' do
        match = Match.create! valid_attributes
        put :update, params: {id: match.to_param, match: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested match' do
      match = Match.create! valid_attributes
      expect {
        delete :destroy, params: {id: match.to_param}, session: valid_session
      }.to change(Match, :count).by(-1)
    end

    it 'redirects to the matches list' do
      match = Match.create! valid_attributes
      delete :destroy, params: {id: match.to_param}, session: valid_session
      expect(response).to redirect_to(matches_url)
    end
  end

end
