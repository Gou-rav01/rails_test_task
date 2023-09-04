# app/controllers/api/users_controller.rb

class  Api::V1::UsersController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:show]


  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    @resource_owner = User.find_by(email: params[:email])

    if @resource_owner && @resource_owner.authenticate(params[:password])
      doorkeeper_token = Doorkeeper::AccessToken.create!(
        application_id: nil,
        resource_owner_id: @resource_owner.id,
      )

      render json: doorkeeper_token.token, status: :created
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  def show
    render json: current_resource_owner.to_json
  end

  private

  def current_resource_owner
    @current_resource_owner ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end

