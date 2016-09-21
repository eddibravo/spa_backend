def jwt_auth_header_for(user)
  { 'Authorization' => "Bearer #{Knock::AuthToken.new(payload: { sub: user.id, id: user.id, username: user.username }).token}"}
end