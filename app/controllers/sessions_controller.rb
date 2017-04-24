class SessionsController < ApplicationController

  def new
    #Nothing to do but render new.html.erb
  end

  def create
    #When user submits the log in form
    #Not using an instance variable since we're not providing the user to a view
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Loged in!"
    else
      flash.now.alert = "Invalid login credentials - try again!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end

end

