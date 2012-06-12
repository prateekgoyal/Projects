class ApplicationController < ActionController::Base
  protect_from_forgery

  def login_required
    if session[:user_id]
      return true
    end
    flash[:warning]='Please login to continue'
    session[:return_to]=request.url
    redirect_to :controller => "sessions", :action => "new"
    return false 
  end

  def admin_required
    if session[:user_id]
      user = User.find(session[:user_id])
      if user.admin == 1
        return true
      else
        flash[:warning]='Please login as admin to continue'
        session[:return_to]=request.url
        redirect_to :controller => "sessions", :action => "new"
        return false 
      end
    end
    flash[:warning]='Please login as admin to continue'
    session[:return_to]=request.url
    redirect_to :controller => "sessions", :action => "new"
    return false 
  end

  def current_user
  	return session[:user_id]
  end


	def redirect_to_stored(user)
    if return_to = session[:return_to]
      session[:return_to] = nil
      redirect_to(return_to)
    else
      redirect_to welcome_user_path(:id => user.id)
    end
  end
end
