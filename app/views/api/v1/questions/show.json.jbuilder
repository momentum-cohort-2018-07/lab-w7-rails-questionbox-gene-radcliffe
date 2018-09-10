json.question do
    json.id @question.id
    json.title @question.title
    json.body @question.body
    json.published_date @question.published_date
end