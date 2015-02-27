class RegistrationsController < Devise::RegistrationsController
	
	before_action :configure_permitted_parameters, if: :devise_controller?

	def destroy
		Event.where(user_id: current_user.id).delete_all
		super 
	end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << [:name, :avatar_url]
  end
end