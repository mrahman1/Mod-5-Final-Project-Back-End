class AuthController < ApplicationController

  def create
    user = User.find_by(username: params[:username])

    if user.authenticate(params[:password])
      render json: {username: user.email, id: user.id}
    else
      render json: {error: 'User is invalid'}, status: 401
    end
  end

end
