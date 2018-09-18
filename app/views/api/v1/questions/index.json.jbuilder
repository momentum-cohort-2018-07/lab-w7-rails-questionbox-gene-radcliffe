json.questions @questions do |question|
    json.extract!(question, :id, :title, :body)
    if question.answers then
      answers = question.answers
     json.answers answers do |answer|
        json.extract!(answer, :id, :title, :body)
     end
    end

end
  