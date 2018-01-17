class AuthController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if !user
      render json: {error: 'User is invalid'}, status: 401

    elsif user.authenticate(params[:password])

      # render json: {
      #   email: user.email,
      #   id: user.id,
      #   jwt: issue_token(user.id),
      #   candidates: user.candidates,
      #   jobs: user.jobs, include: '**'
      # }

      render json: {
        email: user.email,
        id: user.id,
        jwt: issue_token(user.id),
        candidates: user.candidates,
        jobs:
          user.jobs.map do |job|
            JobSerializer.new(job)
          end
      }

      # render json: {
      #   jwt: issue_token(user.id),
      #   user: UserSerializer.new(user)
      # }
    else
      render json: {error: 'Password is invalid'}, status: 401
    end
  end

  def show
    #byebug
    if current_user
      # render json: {
      #   id: current_user.id,
      #   email: current_user.email,
      #   candidates: current_user.candidates,
      #   jobs: current_user.jobs, include: '**'
      # }
      # render json: {
      #   jwt: issue_token(current_user.id),
      #   user: UserSerializer.new(current_user)
      # }
      render json: {
        email: current_user.email,
        id: current_user.id,
        jwt: issue_token(current_user.id),
        candidates: current_user.candidates,
        jobs:
          current_user.jobs.map do |job|
            JobSerializer.new(job)
          end
      }
    else
      render json: {error: 'No id present on headers'}, status: 404
    end
  end


end
