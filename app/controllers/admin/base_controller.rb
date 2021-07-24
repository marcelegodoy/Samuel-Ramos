class Admin::BaseController < ApplicationController
  layout 'dashboard'

  before_action :authenticate_user!
  before_action :verify_admin_permission

  def verify_admin_permission
    redirect_to root_path unless current_user.admin?
  end
end
