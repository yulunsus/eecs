class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
before_filter :configure_permitted_parameters
  # GET /resiurce/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
   def edit
	super     
   end

  # PUT /resource
  
  def update
     super
   end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

    def configure_permitted_parameters
                devise_parameter_sanitizer.for(:sign_up).push(:username, :first_name, :last_name , :nick_name , :description , :class_year, :email);
                devise_parameter_sanitizer.for(:account_update).push(:is_admin,:username, :first_name, :last_name , :nick_name , :description , :class_year, :email);
                #devise_parameter_sanitizer.sanitize(:sign_up)
        end

  # You can put the params you want to permit in the empty array.

   def configure_sign_up_params
     devise_parameter_sanitizer.for(:sign_up , :username ) << :attribute
   end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
