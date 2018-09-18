#not using this view
json.answers @answers do |answer|
    json.(answer, :user_id, :title, :body)
 end