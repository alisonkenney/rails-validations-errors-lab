class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    owner = Owner.new(owner_params)
    if owner.save
      redirect_to owner_path(owner)
    else
      flash[:error] = owner.errors.full_messages
      redirect_to new_owner_path
    end
  end

  def show
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)
  end

  def edit
    @owner = Owner.find_by_id params[:id]
  end

  def update
    owner = Owner.find_by_id params[:id]
    owner_params
    owner.update_attributes(owner_params)
    redirect_to owner_path(owner)
  end

  def destroy
    # stretch
  end


  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :phone)
  end

end
