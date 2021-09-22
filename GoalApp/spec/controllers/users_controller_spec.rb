require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "it brings up the login page" do
      allow(subject).to receive(:logged_in?)
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #create" do
    before :each do
      # create(:user)
      allow(subject).to receive(:current_user).and_return(User.last)
    end
    context "with valid params" do
      it "creates a new user" do
        POST :create, user: { username: "chicken", password: "ilovechicken" }
        expect(User.last.username).to eq("chicken") 
      end
      it "redirects to goal index on success" do
        POST :create, user: { username: "chicken", password: "ilovechicken" } 
        expect(response).to redirect_to(goals_url)
      end
    end
    context "with invalid params" do
      it "renders the new template" do
        POST :create, user: { username: "chicken" }
        expect(response).to render_template(:new)
      end
    end
  end


  
end
