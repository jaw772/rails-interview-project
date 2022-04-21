class QuestionsSerializer
    def self.format_response(questions)
      {
        'data': questions.map do |question|
          {
            'type': 'question',
            'attributes': {
              'question_id': question.id,
              'title': question.title,
              'answers':question.answers.map do |answer|
                {
                  'body': answer.body,
                  'user_id': answer.user_id,
                }
              end
            }
          }
        end
      }
    end
end
