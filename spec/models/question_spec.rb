require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'relationships' do
    it { should have_many(:answers) }
    it { should belong_to(:user) }
  end

  describe '#get_public_questions' do
    it 'returns all questions with a false value for private attribute' do
      questions = Question.get_public_questions

      expect(questions.first.private).to be false
    end
  end
end
