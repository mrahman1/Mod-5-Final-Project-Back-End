class AuthController < ApplicationController

  def signup
    user = User.find_by(email: params[:email])
    if user
      render json: {error: 'User already exists'}, status: 401
    else
      user = User.create(email: params[:email], password: params[:password], company_id: params[:company_id])

      render json: {
        email: user.email,
        id: user.id,
        jwt: issue_token(user.id),
        candidates:  user.candidates.map do |candidate|
            CandidateSerializer.new(candidate)
          end,
        jobs: user.jobs
      }
    end

  end



  def create
    user = User.find_by(email: params[:email])

    if !user
      render json: {error: 'User is invalid'}, status: 401

    elsif user.authenticate(params[:password])


      render json: {
        email: user.email,
        id: user.id,
        jwt: issue_token(user.id),
        candidates:  user.candidates.map do |candidate|
            CandidateSerializer.new(candidate)
          end,
        jobs: user.jobs.map do |job|
          JobSerializer.new(job)
        end,
        applications: user.applications.map do |application|
          ApplicationSerializer.new(application)
        end
      }


    else
      render json: {error: 'Password is invalid'}, status: 401
    end
  end

  def show
    #byebug
    if current_user

      render json: {
        email: current_user.email,
        id: current_user.id,
        jwt: issue_token(current_user.id),
        candidates: current_user.candidates.map do |candidate|
            CandidateSerializer.new(candidate)
          end,
        jobs:
          current_user.jobs.map do |job|
            JobSerializer.new(job)
          end,
          applications: current_user.applications.map do |application|
            ApplicationSerializer.new(application)
          end
      }
    else
      render json: {error: 'No id present on headers'}, status: 404
    end
  end


end
