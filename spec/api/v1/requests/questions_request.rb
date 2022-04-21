require 'rails_helper'

RSpec.describe 'Questions Request' do
  describe 'GET /questions' do
    it "returns all questions and answers that are associated" do
      tenant = Tenant.first
      get '/api/v1/questions', {api_key: tenant.api_key}

      expect(response).to be_successful

      questions = JSON.parse(response.body, symbolize_names: true)
      # binding.pry
      expect(questions).to be_a Hash
      expect(questions[:data].first).to have_key(:attributes)
      expect(questions[:data].first[:attributes]).to have_key(:question_id)
      expect(questions[:data].first[:attributes]).to have_key(:answers)
    end
  end

  describe 'Sad Paths/Edge Cases' do
    describe 'Invalid api key' do
      it 'returns status code 400 and is unsuccessful' do
        tenant = Tenant.first
        get '/api/v1/questions', {api_key: "owgauszugaw325432654rwsfdsa4atr"}

        expect(response).to_not be_successful
        expect(response.status).to eq 400
      end
    end
    describe 'Api key not present' do
      it 'returns status code 400 and is unsuccessful' do
        get '/api/v1/questions'

        expect(response).to_not be_successful
        expect(response.status).to eq 400
      end
    end 
  end

end
