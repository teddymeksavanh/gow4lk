# spec/requests/places_spec.rb
require 'rails_helper'

RSpec.describe 'Places API' do
  # Initialize the test data
  let!(:stroll) { create(:stroll) }
  let!(:places) { create_list(:place, 20, stroll_id: stroll.id) }
  let(:stroll_id) { stroll.id }
  let(:id) { places.first.id }

  # Test suite for GET /strolls/:stroll_id/places
  describe 'GET /strolls/:stroll_id/places' do
    before { get "/strolls/#{stroll_id}/places" }

    context 'when stroll exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all stroll places' do
        expect(json.size).to eq(20)
      end
    end

    context 'when stroll does not exist' do
      let(:stroll_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Stroll/)
      end
    end
  end

  # Test suite for GET /strolls/:stroll_id/places/:id
  describe 'GET /strolls/:stroll_id/places/:id' do
    before { get "/strolls/#{stroll_id}/places/#{id}" }

    context 'when stroll place exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the place' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when stroll place does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Places/)
      end
    end
  end

  # Test suite for PUT /strolls/:stroll_id/places
  describe 'POST /strolls/:stroll_id/places' do
    let(:valid_attributes) { { name: 'Visit Narnia', done: false } }

    context 'when request attributes are valid' do
      before { post "/strolls/#{stroll_id}/places", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/strolls/#{stroll_id}/places", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /strolls/:stroll_id/places/:id
  describe 'PUT /strolls/:stroll_id/places/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/strolls/#{stroll_id}/places/#{id}", params: valid_attributes }

    context 'when place exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the place' do
        updated_place = Place.find(id)
        expect(updated_place.name).to match(/Mozart/)
      end
    end

    context 'when the place does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Place/)
      end
    end
  end

  # Test suite for DELETE /strolls/:id
  describe 'DELETE /strolls/:id' do
    before { delete "/strolls/#{stroll_id}/places/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
