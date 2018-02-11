class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    # 個人アプリなので他のユーザーはいらない
    # User.allはテスト用
    # @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    # user_paramsはストロングパラメーター
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      
      # リダイレクトするのはインデックスで良いのでは
      redirect_to @user
      
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  
  
end
