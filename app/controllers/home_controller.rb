class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to persons_profile_path
    end
  end
end
