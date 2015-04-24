class ApplicationController < ActionController::Base
  include AuthenticationManagement

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Set the model class that manages authentication
  user_class User

  # All controller actions need to verify authentication,
  # except for SessionController and StaticPagesController actions.
  before_action do |controller|
    
    if controller.class.name == 'PagesController' or
       (controller.class.name == 'UsersController' && (['new', 'create'].include? params[:action])) or
       (controller.class.name == 'SessionsController' && (['new', 'create'].include? params[:action]))
      self.require_no_authentication
    else
      self.require_authentication
    end
  end


end
