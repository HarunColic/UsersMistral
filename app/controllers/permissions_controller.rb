class PermissionsController < ApplicationController
  before_action :set_permission, only: %i[ show edit update destroy ]

  def index
    @permissions = Permission.all
  end

  def show
  end

  def new
    @permission = Permission.new
  end

  def edit
  end

  def create
    @permission = Permission.new(permission_params)

    respond_to do |format|
      if @permission.save
        format.html { redirect_to permission_url(@permission), notice: "Permission was successfully created." }
        format.json { render :show, status: :created, location: @permission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @permission.update(permission_params)
        format.html { redirect_to permission_url(@permission), notice: "Permission was successfully updated." }
        format.json { render :show, status: :ok, location: @permission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @permission.destroy

    respond_to do |format|
      format.html { redirect_to permissions_url, notice: "Permission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_permission
      @permission = Permission.find(params[:id])
    end

    def permission_params
      params.require(:permission).permit(:code, :description)
    end
end
