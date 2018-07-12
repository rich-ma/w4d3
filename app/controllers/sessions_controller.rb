class SessionsController < ApplicationController
    before_action :require_logged_in, only: [:destroy]
    
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login!(@user)
      redirect_to cats_url
    else
      flash[:error] = ["Invalid username/password combo"]
    end
  end
  
  
  def destroy
    logout!
    redirect_to new_session_url
  end
  
  
  # private
  # def session_params
  #   params.require(:session).permit()
  # end
end