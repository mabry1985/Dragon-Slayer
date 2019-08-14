require 'pry'
class UsersController < ApplicationController


def show
render :index
end

def update
  @user = User.find(params[:user])
  binding.pry
  @item = Item.find(params[:id])
  @item.users.push(current_user)
  @item.save
  @user.default
  @user.equip
  redirect_to all_items_path
end

def fight
   
end
end
