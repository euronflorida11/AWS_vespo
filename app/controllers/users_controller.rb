class UsersController < ApplicationController
  before_action :authenticate_user!
  PER = 10

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(PER)
  end

  def show
    @user = User.find(params[:id])
    @team = @user.teams
    favorites = Favorite.where(user_id: current_user.id).pluck(:team_id)
    @favorite_list = Team.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "会員情報を更新しました。"
    else
      render :edit
    end
  end

  def unsubscribe
    @user = User.find_by(params[:id])
  end

  def withdraw
    @user = current_user
    if @user.update(is_deleted: true)
      reset_session
      redirect_to root_path, notice: "退会処理が完了しました。"
    else
      render :edit
    end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following_user.page(params[:page]).per(PER)
  end

  def follower
    @user = User.find(params[:id])
    @users = @user.follower_user.page(params[:page]).per(PER)
  end

  private
  def user_params
    params.require(:user).permit(:id, :profile_image, :email, :last_name, :first_name, :kana_last_name, :kana_first_name, :handle_name, :postcode, :address, :phone_number, :is_deleted, :prefecture_code, :address_city, :address_street, :address_building, :introduction)
  end
end
