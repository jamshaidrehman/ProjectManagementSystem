module Member
  class BaseController < ApplicationController
    before_action :restrict_non_member

    def restrict_non_member
      return redirect_to root_path if current_user.blank? || !current_user.member?
    end
  end
end
