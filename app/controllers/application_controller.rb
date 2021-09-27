class ApplicationController < ActionController::Base
  before_action :sidebar_text
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def sidebar_text
    @name = Text.find_by(identifier: "name")
    @title = Text.find_by(identifier: "title")
    @description = Text.find_by(identifier: "description")
  end

  def configure_permitted_parameters
    added_attrs = [:id, :email, :password, :password_confirmation, :role]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
