class BaseController < ApplicationController
  before_action :restrict_non_manager

  def restrict_non_manager
    return redirect_to root_path unless current_user.admin? || current_user.manager?
  end
end
