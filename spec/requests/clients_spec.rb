require 'rails_helper'

RSpec.describe 'MathLLC API', type: :request do
  # initialize test data
  let!(:user) { create(:user) } 
  let!(:clients) { create_list(:client, 10, user_id: user.id) }
  let(:client_id) { clients.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /clients
  describe 'GET /clients' do
    # make HTTP get request before each example
    before { get '/clients', params: {}, headers: headers  }

    it 'returns clients' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /clients/:id
  describe 'GET /clients/:id' do
    before { get "/clients/#{client_id}", params: {}, headers: headers  }

    context 'when the record exists' do
      it 'returns the client' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(client_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:client_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Client/)
      end
    end
  end

  # Test suite for POST /clients
  describe 'POST /clients' do
    # valid payload
    let(:valid_attributes) { 
      { last_name: "Kingan", 
        first_name: "Batwon", 
        email: "batwon@gmail.com",
        entity_type: 1,
        tax_id: 1234,
        user_id: user.id.to_s 
      }.to_json
    }

    context 'when the request is valid' do
      before { post '/clients', params: valid_attributes, headers: headers }

      it 'creates a client' do
        expect(json['last_name']).to eq('Kingan')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { last_name: nil, email: nil }.to_json }
      before { post '/clients', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("Validation failed: Last name can't be blank, Email can't be blank, Entity type can't be blank, Tax can't be blank")
      end
    end
  end

  # Test suite for PUT /clients/:id
  describe 'PUT /clients/:id' do
    let(:valid_attributes) { { last_name: 'Shopping', email: 'shop@drop.com' }.to_json }

    context 'when the record exists' do
      before { put "/clients/#{client_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /clients/:id
  describe 'DELETE /clients/:id' do
    before { delete "/clients/#{client_id}", params: {}, headers: headers}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
