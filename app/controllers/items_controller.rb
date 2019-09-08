class ItemsController < ApplicationController
  
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
    unless @item 
      render plain: "404 Not Found", status: 404
    end
  end

  def new
    @item = Item.new
  end

  def edit
  end

  #/items POST
  def create
    @item = Item.create(item_params)
    if @item.errors.empty?
    redirect_to item_path(@item) #/items/:id
    else
      render 'edit'
    end
  end

    def update
      @item.update_attributes(item_params)
      if @item.errors.empty?
      redirect_to item_path(@item) #/items/:id
      else
        render 'new'
      end
    end

    def destroy
      @item.destroy

      redirect_to action: "index"
    end



  private
    def item_params
      params.require(:item).permit(:price, :name, :weight, :description)
    end  

    def find_item
      @item = Item.find(params[:id])
    end
end
