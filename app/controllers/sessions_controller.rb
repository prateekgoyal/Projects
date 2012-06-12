
class SessionsController < ApplicationController
  def new
  	respond_to do |format|
  		format.html
  	end

  end

  def create
  	email = params[:email]
  	password = params[:password]
  	if user = User.authenticate(email, password)
  		session[:user_id] = user.id
  		redirect_to_stored(user)		# redirect_to "http://www.google.com"
  	else
  		redirect_to :action => 'new', :alert => "Invalid user/password combination"
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :controller => "posts", :action => "index"
  end
end
