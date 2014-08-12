class ProfilesController < ApplicationController
  require 'will_paginate/array'
  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
    flash[:notice] = "Profile added successfully"
  end
  
  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      redirect_to home_detail_path
    else
      render action: "edit"
    end 
  end 

  def index
    @profile = Profile.all
    @profile = @profile.paginate(:page => params[:page], :per_page => 5)
  end 
end
