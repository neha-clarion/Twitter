class SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    home_detail_path()
  end  
end 