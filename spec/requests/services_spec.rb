require 'rails_helper'

RSpec.describe "/services", type: :request do
  let(:valid_attributes){ { name: "name", version: "0.0.1" } }

  let(:invalid_attributes) { { name: nil, version: "0.0.1.2" } }

  let(:valid_headers) {
    {
      content_type: "application/json"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Service.create! valid_attributes
      get services_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      service = Service.create! valid_attributes
      get service_url(service), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Service" do
        expect {
          post services_url,
               params: { service: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Service, :count).by(1)
      end

      it "renders a JSON response with the new service" do
        post services_url,
             params: { service: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Service" do
        expect {
          post services_url,
               params: { service: invalid_attributes }, as: :json
        }.to change(Service, :count).by(0)
      end

      it "renders a JSON response with errors for the new service" do
        post services_url,
             params: { service: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested service" do
        service = Service.create! valid_attributes
        patch service_url(service),
              params: { service: invalid_attributes }, headers: valid_headers, as: :json
        service.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the service" do
        service = Service.create! valid_attributes
        patch service_url(service),
              params: { service: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the service" do
        service = Service.create! valid_attributes
        patch service_url(service),
              params: { service: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested service" do
      service = Service.create! valid_attributes
      expect {
        delete service_url(service), headers: valid_headers, as: :json
      }.to change(Service, :count).by(-1)
    end
  end
end
