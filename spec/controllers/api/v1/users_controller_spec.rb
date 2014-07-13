require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do

  let(:valid_session) { {} }

  describe "POST create" do
    describe "with valid params" do
       it "creates a new User" do
         expect {
           post :create, {format: 'json', user: attributes_for(:user)}, valid_session
         }.to change(User, :count).by(1)
       end

       it "assigns a newly created user as @user" do
         post :create, {format: 'json', user: attributes_for(:user)}, valid_session
         expect(assigns(:user)).to be_a(User)
         expect(assigns(:user)).to be_persisted
       end

       it "returns the location of the newly created resource" do
         post :create, {format: 'json', user: attributes_for(:user)}, valid_session
         expect(response.location).to_not be_nil
       end
    end

  end

end
