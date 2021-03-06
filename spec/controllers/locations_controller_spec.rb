require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  let(:valid_attributes) {
    { name: 'Club de Go Santa Fe', address: 'testing address 123' }
  }

  let(:invalid_attributes) {
    { address: 'testing address 123', name: '' }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Location.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      location = Location.create! valid_attributes
      get :show, params: {id: location.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      location = Location.create! valid_attributes
      get :edit, params: {id: location.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Location" do
        expect {
          post :create, params: {location: valid_attributes}, session: valid_session
        }.to change(Location, :count).by(1)
      end

      it "redirects to the created location" do
        post :create, params: {location: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Location.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {location: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'new name', address: 'new address' }
      }

      it "updates the requested location" do
        location = Location.create! valid_attributes
        put :update, params: {id: location.to_param, location: new_attributes}, session: valid_session
        location.reload
        expect(location.name).to eq(new_attributes[:name])
        expect(location.address).to eq(new_attributes[:address])
      end

      it "redirects to the location" do
        location = Location.create! valid_attributes
        put :update, params: {id: location.to_param, location: valid_attributes}, session: valid_session
        expect(response).to redirect_to(location)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        location = Location.create! valid_attributes
        put :update, params: {id: location.to_param, location: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested location" do
      location = Location.create! valid_attributes
      expect {
        delete :destroy, params: {id: location.to_param}, session: valid_session
      }.to change(Location, :count).by(-1)
    end

    it "redirects to the locations list" do
      location = Location.create! valid_attributes
      delete :destroy, params: {id: location.to_param}, session: valid_session
      expect(response).to redirect_to(locations_url)
    end
  end

end
