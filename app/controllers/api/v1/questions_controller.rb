class Api::V1::QuestionsController < ApplicationController
  def index
    tenant = Tenant.find_by(api_key: params[:api_key])
    if tenant == nil
      bad_request
    else
      count = tenant.request_counter + 1
      tenant.update_attribute(:request_counter, count)
      questions = Question.get_public_questions
      render json: QuestionsSerializer.format_response(questions), status: 200
    end
  end

  private

  def bad_request
    payload = {
      message: 'Credentials do not match',
      code: 400,
      status: 'BAD REQUEST'
    }

    render json: payload, status: 400
  end
end
