class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    unless @item = Item.where(id: params[:id]).first
      render plain: "404 Not Found", status: 404
    end
  end

  def new
  end

  def edit
  end

  def create
    render plain: params.inspect
    #@item = Item.create(item_params)
    #render plain: " #{@item.id}: #{@item.name} "
  end
end
