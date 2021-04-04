class UsersController < ApplicationController
    before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    #ViewのFormで取得したパラメータをモデルに渡す
    @users = User.search(params[:search])
  end
    
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
