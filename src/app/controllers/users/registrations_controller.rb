# Project name: Pantry Packer
# Description: A single database and network for food pantries to request food items.
# Filename: registrations_controller.rb
# Description: Logic for the acocunt management pages.
# Last modified on: 4/19/22

# frozen_string_literal: true

# Controller for handling the logic within the 'user' pages.
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy

    # Need to delete all associations before deleting this user.
    requests = Request.where("user_id = " + current_user.id.to_s)
    requests.each { |request|
      request.destroy
    }
    
    # Delete the user (devise default destroy method).
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:pantry_name, :pantry_location, :pantry_link, :pantry_desc])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:pantry_name, :pantry_location, :pantry_link, :pantry_desc])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   requests_path
  # end
end
