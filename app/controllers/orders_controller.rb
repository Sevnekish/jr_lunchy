class OrdersController < ApplicationController
  respond_to :html
  before_action :find_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    # filter
    # @hotels = Orders.higher_rating.paginate(page: params[:page], :per_page => 8)
    # new
    # @hotel = current_user.hotels.build
    # @hotel.build_address
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

  def show
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
