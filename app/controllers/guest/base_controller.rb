class Guest::BaseController < ApplicationController
  layout 'application'

  before_action :authenticate_user!
end
