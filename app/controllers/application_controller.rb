class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true
  before_action :persist_last_visited_path, :authenticate_user!, except: [:home]


  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def after_sign_in_path_for(resource)
    if session[:last_visited_path].present?
      session[:last_visited_path]
    else
      root_path
    end
  end


  private

  def persist_last_visited_path
    unless Rails.configuration.ignored_paths.include?(request.path) || request.xhr?
      session[:last_visited_path] = request.path
    end
  end

end
