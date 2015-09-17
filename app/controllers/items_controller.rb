class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  skip_before_filter  :verify_authenticity_token

  # GET /items
  # GET /items.json
  def index
    headers['Access-Control-Allow-Origin'] = '*'  # this would be the address to your data service
    @items = Item.all
    respond_to do |format|
      format.html  #default  index.html.erb
      format.json { render json: @items }
    end
  end

  # POST /items
  # POST /items.json
  def create
    headers['Access-Control-Allow-Origin'] = '*'  # this would be the address to your data service
    @item = Item.new(description: params[:description])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item.id }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    headers['Access-Control-Allow-Origin'] = '*'  # this would be the address to your data service
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { render json: params[:id] }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:description)
    end

end
