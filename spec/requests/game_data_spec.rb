# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Game data requests', type: :request do
  let(:external_url) { 'https://api.rawg.io/api/games' }
  let(:games_response) do
    { 'results' => [
      {
        'name' => 'Grand Theft Auto V',
        'background_image' => 'https://media.rawg.io/media/games/b11/b115b2bc6a5957a917bc7601f4abdda2.jpg',
        'id' => 10

      },
      {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
    ],
      'next' => 's',
      'previous' => 's' }.to_json
  end
  describe 'GET /fetch_games' do
   
    before(:each) do
      stub_request(:get, external_url)
        .with(headers: { "User-Agent": 'Game Drive' })
        .to_return(status: 200, body: games_response)
      get api_v1_fetch_games_path
    end
    it 'returns data for 20 games' do
      expect(response).to have_http_status(200)
      expect(response.parsed_body['games'].count).to be(20)
    end
    it 'returns links to the next and previous set of games' do
      expect(response.parsed_body['previous']).to be_a(String)
      expect(response.parsed_body['next']).to be_a(String)
    end
    it 'contains the name, image and id for a game' do
      expect(response.parsed_body['games'].first['title']).to be_a(String)
      expect(response.parsed_body['games'].first['image']).to be_a(String)
      expect(response.parsed_body['games'].first['rawg_id']).to be_a(Integer)
    end
  end

  describe 'POST /fetch_game_info' do
    let(:game_info_response) do
      {
        'name' => 'The Witcher 3',
        'description' => 'Top game',
        'background_image' => 'image.jpg'
      }.to_json
    end
    before(:each) do
      stub_request(:get, "#{external_url}/10")
        .with(headers: { "User-Agent": 'Game Drive' })
        .to_return(status: 200, body: game_info_response)
      post api_v1_fetch_game_path, params: { id: 10 }
    end
    it 'returns the title, image and description for a game' do 
      expect(response.parsed_body['title']).to be_a String
      expect(response.parsed_body['image']).to be_a String
      expect(response.parsed_body['description']).to be_a String
    end
    ## Add test for invalid game 
  end
  describe 'POST /search' do    
    before(:each) do 
      stub_request(:get, "#{external_url}?search=Grand Theft Auto V" )
        .with(headers: { "User-Agent": 'Game Drive' })
        .to_return(status: 200, body: games_response)
      post api_v1_search_path, params: {searchTerm: 'Grand Theft Auto V'}
    end
    it 'returns links to the next and previous set of games' do
      expect(response.parsed_body['previous']).to be_a(String)
      expect(response.parsed_body['next']).to be_a(String)
    end
    it 'contains the name, image and id for a game' do
      expect(response.parsed_body['games'].first['title']).to be_a(String)
      expect(response.parsed_body['games'].first['image']).to be_a(String)
      expect(response.parsed_body['games'].first['rawg_id']).to be_a(Integer)
    end
  end
end
