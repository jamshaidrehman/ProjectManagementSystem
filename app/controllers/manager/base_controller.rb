module Manager
  class BaseController < ApplicationController
    before_action :restrict_non_manager

    def restrict_non_manager
      return redirect_to root_path if current_user.blank? || !(current_user.admin? || current_user.manager?)
    end
  end
end
