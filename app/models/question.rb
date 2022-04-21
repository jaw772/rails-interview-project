class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user

  def self.get_public_questions
    Question.where(private: false)
  end
end
