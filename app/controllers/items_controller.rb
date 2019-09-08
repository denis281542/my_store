class ItemsController < ApplicationController
  
  before_action :find_item,      only: [:show, :edit, :update, :destroy, :upvote]
  before_action :check_if_admin, only: [:new, :edit, :create, :update, :destroy]

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

    def upvote
      @item.increment!(:votes_count)
      redirect_to action: :index
    end  

  private
    def item_params
      params.require(:item).permit(:price, :name, :weight, :description)
    end  

    def find_item
      @item = Item.find(params[:id])
    end

    def check_if_admin
      #render plain: "Access denied", status: 403, unless params[:admin]  
    end
  end
