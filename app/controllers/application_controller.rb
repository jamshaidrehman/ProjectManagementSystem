class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.role == 'admin'
      root_path
    elsif resource.role == 'admin' || resource.role == 'manager'
      manager_clients_path
    else
    admin_user_path(resource)
    end
  end
end
