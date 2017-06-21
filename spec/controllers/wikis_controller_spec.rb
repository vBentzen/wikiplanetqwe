require 'rails_helper'

RSpec.describe WikisController, type: :controller do

  let(:my_user) { User.create!(email: "user@bloccit.com", password: "helloworld", password_confirmation: "helloworld") }
  let(:my_wiki) { my_topic.posts.create!(title: Faker::Name.name, body: Faker::Lorem.paragraph, private: false, user: my_user) }
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should assign [my_wiki] to @wikis" do
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
