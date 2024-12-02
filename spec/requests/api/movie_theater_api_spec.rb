require 'rails_helper'

describe 'Movie Theater API' do 
  context 'GET /api/v1/movie_theater/:id' do
    it 'success' do
      movie_theater = FactoryBot.create(:movie_theater, name: 'Cine Paradiso')
      user = FactoryBot.create(:user, email: 'joao@email.com', password: '123456789')
      first_room = Room.create!(movie_theater: movie_theater, name: 'Sala 001', capacity: 120)
      second_room = Room.create!(movie_theater: movie_theater, name: 'Sala 002', capacity: 100)
      third_room = Room.create!(movie_theater: movie_theater, name: 'Sala 003', capacity: 80)

      get "/api/v1/movie_theater/#{movie_theater.id}"

      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)

      expect(json_response['movie_theater']).to eq 'Cine Paradiso'
      expect(json_response['city']).to eq 'Brasília'
      expect(json_response['total_capacity']).to eq '300'
    end
  end
end