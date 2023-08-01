class ApplicationController < ActionController::Base
    before_action :authenticate_user!


    
    rescue_from CanCan::AccessDenied do |exception|
        redirect_back_or_to @books, :alert => exception.message
      end



    include Pundit::Authorization
    

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  
    private
  
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_back(fallback_location: root_path)
    end


#add role(enum) in devise
    protect_from_forgery with: :exception

     before_action :configure_permitted_parameters, if: :devise_controller?

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role, :email, :password)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:role, :email, :password, :current_password)}
          end
end
