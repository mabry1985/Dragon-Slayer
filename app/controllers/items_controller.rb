class ItemsController < ApplicationController

  def index
    @item = Item.new
    render :new
  end

  def all
    @items = Item.all
    # @item = Item.find()
    render :all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Item Created"
      redirect_to user_items_path(current_user)
    else
      render :new
    end
  end

 def show
   @item = Item.find(params[:id])
  render :show
 end

def edit
  @item = Item.find(params[:id])
  render :edit
end

def update
  @item = Item.find(params[:id])
  @item.save
  binding.pry
  if @item.update(item_params)
    redirect_to user_item_path(current_user, @item)
  else
    render :edit
  end
end

def destroy
  @items = Item.all
  @item = Item.find(params[:id])
  @item.destroy
  redirect_to all_items_path(@items)
end

def add
  @user = User.find(current_user.id)
  binding.pry
  @item = Item.find(params[:id])
  @item.users.push(current_user)
  @item.save
  @user.default
  @user.equip
  redirect_to all_items_path
end


  private
  def item_params
    params.fetch(:item, {}).permit(:name, :strength, :speed, :health, :durability)
  end
end
