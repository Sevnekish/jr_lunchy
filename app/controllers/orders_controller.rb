class OrdersController < ApplicationController
  respond_to :html
  before_action :find_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    # needed only for menu showing right, do it only for menu
    # params[:date] = params[:date].present? ? params[:date].to_date : Date.today
    @orders = Order.filter(params.slice(:date, :organization))
    @orders = @orders.where(user: current_user) unless current_user.admin?

    @order = current_user.orders.build

    #items for this day menu
  end

  def create
    # @hotel = current_user.hotels.build(hotel_params)

    # if @hotel.save
    #   flash[:success] = "New hotel added successfully!"
    #   redirect_to hotel_path(@hotel)
    # else
    #   render 'new'
    # end
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
      params.require(:hotel).permit(
                                    )
    end

    def find_order
      # @hotel = Hotel.find(params[:id])
    end

end
