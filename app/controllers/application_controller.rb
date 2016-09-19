class ApplicationController < ActionController::API
  include Knock::Authenticable

  private
  def authenticate_for entity_class
    token = params[:token] || token_from_request_headers
    return nil if token.nil?

    begin
      @entity = Knock::AuthToken.new(token: token).entity_for(entity_class)
      define_current_entity_getter(entity_class)
      @entity
    rescue => ex
      logger.error ex.message
      nil
    end
  end
end
