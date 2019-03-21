require 'rails_helper'

RSpec.describe LeaguesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # League. As you add validations to League, be sure to
  # adjust the attributes here as well.

  let(:director) { create :player }
  let(:valid_attributes) {
    {'name'=>'Otra', 'edition'=>'123', 'start_date(1i)'=>'2014',
     'start_date(2i)'=>'3', 'start_date(3i)'=>'1', 'end_date(1i)'=>'2016',
     'end_date(2i)'=>'3', 'end_date(3i)'=>'16', 'director_id'=> director.id.to_s}
  }

  let(:invalid_attributes) {
    {'name'=>'Otra', 'edition'=>'123', 'start_date(1i)'=>'2014',
     'start_date(2i)'=>'3', 'start_date(3i)'=>'1', 'end_date(1i)'=>'2016',
     'end_date(2i)'=>'3', 'end_date(3i)'=>'16', 'director_id'=> nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LeaguesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      League.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      league = League.create! valid_attributes
      get :show, params: {id: league.to_param}, session: valid_session
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
      league = League.create! valid_attributes
      get :edit, params: {id: league.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new League' do
        expect {
          post :create, params: {league: valid_attributes}, session: valid_session
        }.to change(League, :count).by(1)
      end

      it 'redirects to the created league' do
        post :create, params: {league: valid_attributes}, session: valid_session
        expect(response).to redirect_to(League.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {league: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_name) { "this aren't the droids we are looking for - League" }
      let(:new_attributes) {
        valid_attributes.merge 'name' => new_name
      }

      it 'updates the requested league' do
        league = League.create! valid_attributes
        put :update, params: {id: league.to_param, league: new_attributes}, session: valid_session
        league.reload
        expect(league.name).to eq(new_name)
      end

      it 'redirects to the league' do
        league = League.create! valid_attributes
        put :update, params: {id: league.to_param, league: valid_attributes}, session: valid_session
        expect(response).to redirect_to(league)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        league = League.create! valid_attributes
        put :update, params: {id: league.to_param, league: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested league' do
      league = League.create! valid_attributes
      expect {
        delete :destroy, params: {id: league.to_param}, session: valid_session
      }.to change(League, :count).by(-1)
    end

    it 'redirects to the leagues list' do
      league = League.create! valid_attributes
      delete :destroy, params: {id: league.to_param}, session: valid_session
      expect(response).to redirect_to(leagues_url)
    end
  end

end
