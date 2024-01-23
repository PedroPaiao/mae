class SessionService <  BusinessProcess::Base
  needs :session_params

  steps :find_professional,
        :verify_password

  def call
    process_steps
    @professional
  end

  private

    def verify_password
      unless @professional.valid_password?(session_params[:password])
        fail([I18n.t('services.session_service.errors.invalid_params')])
      end
    end

    def find_professional
      @professional = Professional.find_for_database_authentication(phone: session_params[:phone])
      fail([I18n.t('services.session_service.errors.user_not_found')]) if @professional.blank?
    end
end

