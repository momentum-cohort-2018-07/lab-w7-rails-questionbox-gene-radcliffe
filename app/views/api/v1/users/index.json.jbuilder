json.array!(@user) do |user| 
    json.id user.id
    json.(user, :username, :email, :auth_token)
end