require 'rails_helper'
require 'json'
require "pp"

RSpec.describe "Categories", type: :request do
  describe "GET /location/videos" do
    it "filters by location" do
      FactoryGirl.create :video, title: 'Video1', location: "London"
      FactoryGirl.create :video, title: 'Video2', location: "Birmingham"

      get "/api/London/videos"
      data = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(data['videos'].length).to eq(1)
    end
  end

  describe "GET /categories/ID/videos" do
    it "filters by category" do
      cat1 = FactoryGirl.create :category, name: 'cat1'
      FactoryGirl.create :video, title: 'Video1', location: "London", categories: [cat1]
      FactoryGirl.create :video, title: 'Video2', location: "Birmingham"

      get "/api/categories/#{cat1.id}/videos"
      data = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(data['videos'].length).to eq(1)
    end
  end

  describe "GET /videos" do
    it "does not filter" do
      FactoryGirl.create :video, title: 'Video1', location: "London", categories: [FactoryGirl.create(:category, name: 'cat1')]
      FactoryGirl.create :video, title: 'Video2', location: "Birmingham"

      get "/api/videos"
      data = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(data['videos'].length).to eq(2)
    end
  end
end
