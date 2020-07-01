class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :pseudo])
    end

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  #   def pundit_user
  #   User.find_by_id(current_user)
  # end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    # redirect_to(request.referrer || root_path)
  end
end
