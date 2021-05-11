#this related to login path

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to user_path(user)
    else
      render 'new'
    end
  end

  def delete
    # if change to destroy, will not work
    log_out
    redirect_to root_path, notice: 'You have logged out'
  end

end
