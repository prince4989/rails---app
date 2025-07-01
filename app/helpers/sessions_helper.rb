module SessionsHelper
  # this login in the user with session controllers users id
  def log_in(user)
    session[:user_id] = user.id
    session[:session_token] = user.session_token
  end
  #this stored the current user id as the session  user_id
  def current_user
    if (user_id = session[:user_id])
      user = User.find_by(id: user_id)
      if user && session[:session_token] == user.session_token
        @current_user = user
      end
    elsif (user_id = cookies.encrypted[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Remembers a user in a persistent session the user.remember is in the model fintion and this save digest in the db and then the cookies token compare and gives the value
  def remember(user)
    user.remember
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns true if the user is logged in, false otherwise.

  def logged_in?
    !current_user.nil?
  end

  #forget the user.forget is from yhe model user
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    reset_session
    @current_user = nil
  end

  def current_user?(user)
    user && user == current_user
  end
  # for the reset of the session

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
