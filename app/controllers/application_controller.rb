class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  #before_filter :data
  protect_from_forgery
  #def data
    #@profile = Profile.find_by_user_id(current_user.id)
    #@post = Post.new
  #end  
end


