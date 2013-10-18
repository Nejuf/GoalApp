class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],
                                    params[:user][:password])

    if @user.nil?
      flash.now[:errors] = ["Incorrect username/password"]
      render :new
    else
      redirect_to @user
    end
  end

  def destroy

  end
end
