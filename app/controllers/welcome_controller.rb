class WelcomeController < ApplicationController
  def index
    @user_count = User.count
    @question_count = Question.count
    @answer_count = Answer.count
    @request_total = Tenant.total_requests
  end
end
