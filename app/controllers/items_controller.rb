class ItemsController < ApplicationController

  def index
    @item = Item.new
    render :new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Item Created"
      redirect_to admin_items_path(current_user)
    else
      render :new
    end
  end

  

  private
  def item_params
    params.require(:item).permit(:name, :strength, :speed, :health, :durability)
  end
end
