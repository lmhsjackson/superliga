require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  let(:valid_attributes) {
    {'name'=>'pipo', 'email'=>'pipi@pipo.com', 'rango'=>'5K'}
  }

  let(:invalid_attributes) {
    {'name'=>'pipo', 'email'=>'NOTaMAIL', 'rango'=>'5K'}
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Player.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      player = Player.create! valid_attributes
      get :show, params: {id: player.to_param}, session: valid_session
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
      player = Player.create! valid_attributes
      get :edit, params: {id: player.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Player' do
        expect {
          post :create, params: {player: valid_attributes}, session: valid_session
        }.to change(Player, :count).by(1)
      end

      it 'redirects to the created player' do
        post :create, params: {player: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Player.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the \'new\' template)' do
        post :create, params: {player: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_name) { 'new_' + valid_attributes['name'] }
      let(:new_attributes) {
        valid_attributes.merge('name' => new_name)
      }

      it 'updates the requested player' do
        player = Player.create! valid_attributes
        put :update, params: {id: player.to_param, player: new_attributes}, session: valid_session
        player.reload
        expect(player.name).to eq(new_name)
      end

      it 'redirects to the player' do
        player = Player.create! valid_attributes
        put :update, params: {id: player.to_param, player: valid_attributes}, session: valid_session
        expect(response).to redirect_to(player)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the \'edit\' template)' do
        player = Player.create! valid_attributes
        put :update, params: {id: player.to_param, player: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested player' do
      player = Player.create! valid_attributes
      expect {
        delete :destroy, params: {id: player.to_param}, session: valid_session
      }.to change(Player, :count).by(-1)
    end

    it 'redirects to the players list' do
      player = Player.create! valid_attributes
      delete :destroy, params: {id: player.to_param}, session: valid_session
      expect(response).to redirect_to(players_url)
    end
  end

end
