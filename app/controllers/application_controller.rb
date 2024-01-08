class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception

    # Your other code...
  
    # def after_sign_in_path_for(resource)
    #   # Redirect to the students#index page after sign in
    #   students_path
    # end
    before_action :configure_permitted_parameters,if: :devise_controller?
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, :alert => 'Access Denied'
    end
    
   
    protected
     
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type,:email, :password])
    end
   
end
