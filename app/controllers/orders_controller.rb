class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = current_user.orders
  end

  def show
  end

  def new
    @order = Order.new
    @order.product_id = params[:product_id] if params[:product_id]
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.total_price = @order.product.price * @order.quantity

    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(order_params)
      @order.update(total_price: @order.product.price * @order.quantity)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:product_id, :quantity, :status)
  end
end
