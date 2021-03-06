class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :contact ]

  def home
    redirect_user if current_user

    @projects = Project.all
  end

  def contact
  end

  def redirect_user
    redirect_to current_user.admin? ? admin_projects_path : guest_projects_path
  end
end
