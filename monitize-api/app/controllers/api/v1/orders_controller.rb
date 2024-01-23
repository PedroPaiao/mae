class Api::V1::OrdersController < Api::ApiController
  def index
    render json: paginate(Order.all, OrderSerializer), status: :ok
  end

  def show
    render json: Order.find_by(id: params[:id]), status: :ok
  end

  def create
    client = Client.find(order_params[:client_id])

    products_orders = order_params[:products].map do |param|
      product = Product.find(param[:id])
      ProductOrder.new(product:, price: param[:price], amount: param[:amount])
    end

    order = Order.create(client:, products_orders:)
    render json: order, status: :ok
  end

  private

  def order_params
    params.permit(:client_id, products: [:id, :price, :amount])
  end
end
