class OrderStoresController < ApplicationController
  before_action :set_order_store, only: [:show, :edit, :update, :destroy]

  # GET /order_stores
  # GET /order_stores.json
  def index
    @order_stores = OrderStore.all
  end

  # GET /order_stores/1
  # GET /order_stores/1.json
  def show
  end

  # GET /order_stores/new
  def new
    @order_store = OrderStore.new
  end

  # GET /order_stores/1/edit
  def edit
  end

  # POST /order_stores
  # POST /order_stores.json
  def create
    @order_store = OrderStore.new(order_store_params)

    respond_to do |format|
      if @order_store.save
        format.html { redirect_to @order_store, notice: 'Order store was successfully created.' }
        format.json { render :show, status: :created, location: @order_store }
      else
        format.html { render :new }
        format.json { render json: @order_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_stores/1
  # PATCH/PUT /order_stores/1.json
  def update
    respond_to do |format|
      if @order_store.update(order_store_params)
        format.html { redirect_to @order_store, notice: 'Order store was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_store }
      else
        format.html { render :edit }
        format.json { render json: @order_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_stores/1
  # DELETE /order_stores/1.json
  def destroy
    @order_store.destroy
    respond_to do |format|
      format.html { redirect_to order_stores_url, notice: 'Order store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_store
      @order_store = OrderStore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_store_params
      params.require(:order_store).permit(:store_id, :order_session_id)
    end
end
