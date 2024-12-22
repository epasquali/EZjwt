module EzJwt
  class AuthenticationController < ApplicationController

    # POST /auth/login
    def login
      if @user = User.find_by_email(params[:user][:email])
        if @user&.authenticate(params[:user][:password])
          token = JsonWebToken.encode(user_id: @user.id)
          time = DEFAULT_EXPIRATION
          #time = Time.now + 24.hours.to_i
          render json: { token: token, expires: time.strftime("%m-%d-%Y %H:%M"),
                        email: @user.email, id: @user.id }, status: :ok
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      else
        render json: {error: 'User not found'}, status: :unauthorized
      end
    end

    private

    def login_params
      params.require(:user).permit(:email, :password)
    end

  end

end
