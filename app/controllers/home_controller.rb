class HomeController < ApplicationController
  def index
    if current_user
      @profile = current_user.profile
    end
  end
end
