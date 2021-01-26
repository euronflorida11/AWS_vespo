# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # skip_before_action :user_logged_in?
  before_action :reject_user, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def reject_inactive_user
    @user = User.find_by(email: params[:user][:email])
    if @user
      if @user.is_deleted_password?(params[:user][:password]) && !@user.is_deleted
        redirect_to root_path
      else
        flash[:error] = "削除されませんでした"
      end
    end
  end


  protected
  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if (@user.valid_password?(params[:email][:password]) && (@user.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to about_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
