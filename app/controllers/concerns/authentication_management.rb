# Authentication Management Concern
#
# In order to use this concern, you should include this concern in application
# controller with the following code:
#
# 'user_class User'
#
# This code will set the model class that manages authentication.
#
# On that model class migration you should also add an 'uuid' attribute, which
# will be used as a unique universal identifier. 

module AuthenticationManagement
  extend ActiveSupport::Concern

  included do
    helper_method :log_in, :log_out, :logged_in?
    helper_method :current_user, :current_user?

    class_attribute :user_class_attribute
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

   # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  def require_authentication
    if !logged_in?
      store_location
      redirect_to login_url
    end
  end

  def require_no_authentication
    if logged_in?
      flash[:error] = "Please logout first."
      redirect_to root_url
    end
  end

  private

    def current_user
      user_id = session[:user_id]

      if user_id.nil?
        user_id = cookies.signed[:user_id]

        unless user_id.nil?
          user = self.class.user_class_attribute.find(user_id)

          if user and user.authenticated?(:remember, cookies[:remember_token])
            log_in user
            @current_user = user
          end

        end

      else
        @current_user ||= self.class.user_class_attribute.find(user_id)
      end
    end

    def current_user?(user)
      user == current_user
    end

  module ClassMethods

    def user_class(attribute)
      self.user_class_attribute = attribute
    end

  end

end
