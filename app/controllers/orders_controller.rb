class OrdersController < ApplicationController
  respond_to :html
  before_action :find_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    #TODO change time zone convert 
    params[:date] = params[:date].present? ? params[:date].to_datetime.in_time_zone('Moscow').end_of_day : DateTime.now
    @date = params[:date]
    @orders = Order.filter(params.slice(:date, :organization))
    @orders = @orders.where(user: current_user) unless current_user.admin?

    @day_menu = DayMenu.actual(params[:date])

    respond_with @orders, @day_menu, @date
  end

  def new
    @order = Order.new
    @date = DateTime.now
    @items = DayMenu.actual(@date).items

    respond_with @order, @items, @date
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
                                    :item_ids => []
                                    )
    end

    def find_order
      # @hotel = Hotel.find(params[:id])
    end

end
