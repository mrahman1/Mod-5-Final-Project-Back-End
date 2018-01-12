class AuthController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if !user
      render json: {error: 'User is invalid'}, status: 401
    elsif user.authenticate(params[:password])
      render json: {email: user.email, id: user.id}
    else
      render json: {error: 'Password is invalid'}, status: 401
    end
  end

end
