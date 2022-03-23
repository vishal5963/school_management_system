class Admins::DashboardController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!
  def index
  end
end
