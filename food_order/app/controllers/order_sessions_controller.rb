class OrderSessionsController < ApplicationController
  before_action :set_order_session, only: [:show, :edit, :update, :destroy]

  # GET /order_sessions
  # GET /order_sessions.json
  def index
    @order_sessions = OrderSession.all
  end

  # GET /order_sessions/1
  # GET /order_sessions/1.json
  def show
  end

  # GET /order_sessions/new
  def new
    @order_session = OrderSession.new
  end

  # GET /order_sessions/1/edit
  def edit
  end

  # POST /order_sessions
  # POST /order_sessions.json
  def create
    @order_session = OrderSession.new(order_session_params)

    respond_to do |format|
      if @order_session.save
        format.html { redirect_to @order_session, notice: 'Order session was successfully created.' }
        format.json { render :show, status: :created, location: @order_session }
      else
        format.html { render :new }
        format.json { render json: @order_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_sessions/1
  # PATCH/PUT /order_sessions/1.json
  def update
    respond_to do |format|
      if @order_session.update(order_session_params)
        format.html { redirect_to @order_session, notice: 'Order session was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_session }
      else
        format.html { render :edit }
        format.json { render json: @order_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_sessions/1
  # DELETE /order_sessions/1.json
  def destroy
    @order_session.destroy
    respond_to do |format|
      format.html { redirect_to order_sessions_url, notice: 'Order session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_session
      @order_session = OrderSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_session_params
      params.require(:order_session).permit(:time_create, :time_lock, :total_money, :user_id, :sotre_id)
    end
end
