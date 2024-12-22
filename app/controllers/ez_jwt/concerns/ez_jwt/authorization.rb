module EzJwt

  module Authorization
    extend ActiveSupport::Concern
    

    def authorize_request
      #This will return errors if user is not found or if there's a decode error
      #which includes an expired token error.
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      begin
        @decoded = JsonWebToken.decode(header)
        @current_user = User.find(@decoded[:user_id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
      rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
      end
    end



  end

end