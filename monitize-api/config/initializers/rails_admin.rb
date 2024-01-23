RailsAdmin.config do |config|
  config.asset_source = :sprockets
  config.main_app_name = ['Monetize', 'Admin']
  if !Rails.env.development?
    config.authorize_with do
      authenticate_or_request_with_http_basic('monetize') do |username, password|
        username == Rails.application.credentials[:admin_user] &&
        password == Rails.application.credentials[:admin_password]
      end
    end
  end
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
