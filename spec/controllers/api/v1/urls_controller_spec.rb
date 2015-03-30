require "rails_helper"

RSpec.describe Api::V1::UrlsController, :type => :controller do

  before(:each) do
    Url.create(long: "http://google.com")
    Url.create(long: "http://turing.io")
  end

  describe "v1/urls_controller" do
    it "responds successfully with all urls" do
      get :index, format: :json
      data = JSON.parse(response.body)

      expect(data.first["long"]).to eq("http://google.com")
      expect(response).to be_success
    end

    it "creates a url" do
      post :create, format: :json, url: { long: "http://gmail.com" }

      new_url = JSON.parse(response.body)
      expect(response).to be_success
      expect(new_url["long"]).to eq("http://gmail.com")
    end

    it "destroys a url" do
      post :create, format: :json, url: { long: "http://gmail.com" }
      new_url = JSON.parse(response.body)
      delete :destroy, format: :json, id: new_url["id"]

      expect(response).to be_success

      get :index, format: :json
      data = JSON.parse(response.body)

      expect(data.count).to eq(2)
    end

  end
end
