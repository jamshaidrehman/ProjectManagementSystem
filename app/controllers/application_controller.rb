class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_users_path
    elsif resource.manager?
      manager_clients_path
    else
      member_time_logs_path(resource)
    end
  end
end
