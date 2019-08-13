require 'pry'
class AdminsController < ApplicationController


def show
render :index
end

def update
  @item = Item.find_by(params[:item_id])
  binding.pry
  @item.users.push(current_user)
  @item.save
  redirect_to all_items_path
end
end
