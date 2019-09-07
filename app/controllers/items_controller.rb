class ItemsController < ApplicationController
  def index
    @items = Item.all
    render inline: @items.map { |i| "#{i.name}: #{i.price}" }.join("</br>")
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
    @item = Item.create(item_params)
    render plain: " #{@item.id}: #{@item.name} "
  end
end
