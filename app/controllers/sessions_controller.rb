class SessionsController < ApplicationController

  def new
  end

  #
  # Log user in & create a session
  # 
  def create
  	attempt_login
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
