class UserPermissionsController < ApplicationController
  before_action :set_user_permission, only: %i[ show edit update destroy ]

  def index
    @user_permissions = UserPermission.all
  end

  def show
  end

  def new
    @user_permission = UserPermission.new
    @user = User.find(request.query_parameters[:user])
    @permissions = Permission.all
  end

  def edit
    @user = User.find(@user_permission.user_id)
    @permissions = Permission.all
  end

  def create
    @user_permission = UserPermission.new(user_permission_params)

    respond_to do |format|
      if @user_permission.save
        format.html { redirect_to user_permission_url(@user_permission), notice: "User permission was successfully created." }
        format.json { render :show, status: :created, location: @user_permission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_permission.update(user_permission_params)
        format.html { redirect_to user_permission_url(@user_permission), notice: "User permission was successfully updated." }
        format.json { render :show, status: :ok, location: @user_permission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_permission.destroy

    respond_to do |format|
      format.html { redirect_to user_permissions_url, notice: "User permission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_user_permission
      @user_permission = UserPermission.find(params[:id])
    end

    def user_permission_params
      params.require(:user_permission).permit(:user_id, :permission_id)
    end
end
