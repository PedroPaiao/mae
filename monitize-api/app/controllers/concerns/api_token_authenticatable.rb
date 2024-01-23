module ApiTokenAuthenticatable
  include ApiCommonResponses
  extend ActiveSupport::Concern

  # You can use any model, like Admin or Driver, just sent headers like above pattern
  # HTTP_#{model_name}_EMAIL and HTTP_#{model_name}_TOKEN

  def authenticate_professional_from_token!
    authenticate_from_token! Professional
  end

  def current_user
    @user
  end

  private
    def authenticate_from_token!(model)
      user, request_token = find_authenticable_by_headers(model)
      if user.present? && user.token_match?(request_token)
        sign_in user, store: false
        @user ||= user
      else
        render_unauthorized_error
      end
    end

  def find_authenticable_by_headers(model)
      request_phone = request.headers["HTTP_#{header_name(model)}_PHONE"].presence
      request_token = request.headers["HTTP_#{header_name(model)}_TOKEN"].presence

      user          = request_phone && model.find_by(phone: request_phone)
      return user, request_token
    end


    def header_name(model)
      model.name.upcase
    end
end
