class SessionsController < ApplicationController
  def new
  end

  def create
    # Find the user by email
    debugger
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #Login and show user's home page and test change
    else
      render "new", status: :unprocessable_entity
  end
end
