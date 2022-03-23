class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to users_authenticated_root_path
    end
  end
end
