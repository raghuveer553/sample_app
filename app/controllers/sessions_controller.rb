class SessionsController < ApplicationController
  def new
  end

  def create
    # Find the user by email
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash[:danger] = "Email and password do not match"
      render "new", status: :unprocessable_entity
    end
  end
end
