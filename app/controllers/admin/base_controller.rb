module Admin
  class BaseController < ApplicationController
    before_action :restrict_non_admin

    def restrict_non_admin
      return redirect_to root_path if current_user.blank? || !current_user.admin?
    end
  end
end
