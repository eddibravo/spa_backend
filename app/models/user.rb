class User < ApplicationRecord
  has_secure_password

  has_many :posts

  def self.from_token_request(request)
    username = request.params[:auth] && request.params[:auth][:username]
    self.find_by_username username
  end

  def to_token_payload
    attributes.symbolize_keys.slice(:id, :username).merge({:sub => self.id})
  end
end
