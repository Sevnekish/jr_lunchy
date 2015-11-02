class OrdersController < ApplicationController
  respond_to :html
  before_action :find_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    params[:date] = params[:date].present? ? params[:date].to_datetime.end_of_day : DateTime.now
    @orders = Order.filter(params.slice(:date, :organization))
    @orders = @orders.where(user: current_user) unless current_user.admin?
    @order = current_user.orders.build
    @items = DayMenu.actual(params[:date]).items

    respond_with @orders, @order, @items
  end

  def new
    # @date = DateTime.now

    # @order = current_user.orders.build
    # @items = DayMenu.actual(date).items

    # respond_with @order, @items, @date
    params[:date] = params[:date].present? ? params[:date].to_datetime.end_of_day : DateTime.now
    @orders = Order.filter(params.slice(:date, :organization))
    @orders = @orders.where(user: current_user) unless current_user.admin?
    @order = current_user.orders.build
    @items = DayMenu.actual(params[:date]).items

    respond_with @orders, @order, @items
  end

  def create
    @order = current_user.orders.build(order_params)
    date = DateTime.now
    @items = DayMenu.actual(date).items
    @order.save
    respond_with @order, location: orders_path
  end

  def edit
  end

  def update
    # if @order.update(order_params)
    #   redirect_to hotel_path(@hotel)
    # else
    #   render 'edit'
    # end
  end

  def destroy
    # if @hotel.destroy
    #   flash[:success] = "Hotel deleted successfully!"
    #   redirect_to hotels_path
    # else
    #   redirect_to hotel_path(@hotel)
    # end
  end

  private

    def order_params
      params.require(:order).permit(
                                    :total,
                                    :organization,
                                    :item_ids
                                    )
    end

    def find_order
      # @hotel = Hotel.find(params[:id])
    end

end
