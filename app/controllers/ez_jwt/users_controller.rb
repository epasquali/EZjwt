module EzJwt

  class UsersController < ApplicationController 
    include EzJwt::Authorization

    #before_action :authorize_request, except: [:create, :password_reset]
    before_action :authorize_request, except: [:create]
  

    # GET /users
    def index
      @users = User.all
      render json: @users, status: :ok
    end


    # GET /user
    def show
      render json: @current_user, status: :ok
    end


    # POST /user/register
    def create
      @user = User.new(user_params)
      if @user.save
      # AdminNotificationsMailer.new_user(@user).deliver_now
        render json: @user, status: :created
      else
        render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
      end
    end

  

    # PATCH/PUT /user
    def update
      if @current_user.update(user_params)
        render json: @current_user, status: :ok
      else
        render json: {errors: @current_user.errors.full_messages}, status: :unprocessable_entity
      end
    end


    # DELETE /user
    #WARNING, THIS NEEDS SERIOOUS FIXING. Should only be done by admin. Or should we allow
    #users to delete their account?
    #def destroy
    #  @user.destroy
    #  render json: "User destroyed.", status: :ok
    #end


    ##POST /user/password_reset
    #def password_reset
    #  #Sends the password reset email
    #  @user = User.find_by(email: params[:email])
    #  if @user
    #   ActivationsMailer.reset_password(@user).deliver_now
    #    render json: @user, status: :accepted
    #  else
    #    render json: {errors: "User not found"}, status: :unprocessable_entity
    #  end
    #
    # end


    # #PATCH/PUT /user/password_update
    # def reset_password
    #   #This controller action is the same as update, but it has a different route, for
    #   #neatness
    #   if @current_user.update(user_params)
    #     render json: @user, status: :ok
    #   else
    #     render json: {errors: @current_user.errors.full_messages}, status: :unprocessable_entity
    #   end
    # end


    private 

    #def admin_user
    #  redirect_to(user_path(current_user)) unless current_user && current_user.admin
    #end

      def user_params
        params.require(:user).permit(:email, :password)
      end

  end

end
