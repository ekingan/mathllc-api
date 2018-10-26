require 'rails_helper'

RSpec.describe 'Jobs API' do
  # Initialize the test data
  let!(:user) { create(:user) }
  let!(:client) { create(:client) }
  let!(:jobs) { create_list(:job, 4, client_id: client.id) }
  let(:client_id) { client.id }
  let(:id) { jobs.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /clients/:client_id/jobs
  describe 'GET /clients/:client_id/jobs' do
    before { get "/clients/#{client_id}/jobs", params: {}, headers: headers }

    context 'when client exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all client jobs' do
        expect(json.size).to eq(4)
      end
    end

    context 'when client does not exist' do
      let(:client_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Client/)
      end
    end
  end

  # Test suite for GET /clients/:client_id/jobs/:id
  describe 'GET /clients/:client_id/jobs/:id' do
    before { get "/clients/#{client_id}/jobs/#{id}", params: {}, headers: headers }

    context 'when client job exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the job' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when client job does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Job/)
      end
    end
  end

  # Test suite for PUT /clients/:client_id/jobs
  describe 'POST /clients/:client_id/jobs' do
    let(:valid_attributes) { { form: 1, job_type: 1, price: 100.00 }.to_json }

    context 'when request attributes are valid' do
      before { post "/clients/#{client_id}/jobs", params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/clients/#{client_id}/jobs", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Form can't be blank, Job type can't be blank/)
      end
    end
  end

  # Test suite for PUT /clients/:client_id/jobs/:id
  describe 'PUT /clients/:client_id/jobs/:id' do
    let(:valid_attributes) { { form: 1, job_type: 1, price: 100.00 }.to_json }

    before { put "/clients/#{client_id}/jobs/#{id}", params: valid_attributes, headers: headers }

    context 'when job exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the job' do
        updated_job = Job.find(id)
        expect(updated_job.price).to match(100.00)
      end
    end

    context 'when the job does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Job/)
      end
    end
  end

  # Test suite for DELETE /clients/:id
  describe 'DELETE /clients/:id' do
    before { delete "/clients/#{client_id}/jobs/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
