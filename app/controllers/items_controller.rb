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
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.create(item_params)
    if @item.errors.empty?
    redirect_to item_path(@item)
    else
      render 'new'
    end
  end

  private
    def item_params
      params.require(:item).permit(:price, :name, :weight, :description)
    end  
end
