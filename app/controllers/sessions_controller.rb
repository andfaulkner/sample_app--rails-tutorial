class SessionsController < ApplicationController

  def new
  end

  # 
  # Create a session - aka log a user in
  # 
  def create
  	authenticate error: 	method(:show_login_fail_msg),
  							 success: method(:log_in)
  end

  def destroy
  end

end
