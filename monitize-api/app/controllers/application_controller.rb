class ApplicationController < ActionController::API
  include ApiTokenAuthenticatable
  include ApiCommonResponses
end
