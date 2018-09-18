
json.questions @questions do |question|
    json.set! :user_id,question.user_id
    json.set! :title,question.title
    json.set! :body,question.body
  end