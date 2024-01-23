class Api::V1::ProductsController < Api::ApiController
  def index
    render json: paginate(Product.all, ProductSerializer), status: :ok
  end

  def show
    render json: Product.find_by(id: params[:id]), status: :ok
  end

  def create
    product = Product.create(product_params)
    render json: product, status: :created
  end

  def update
    product = Product.find_by(id: params[:id])
    product.update(product_params)
    render json: product, status: :created
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Removido com sucesso" }, status: :ok
  end

  private

  def product_params
    params.permit(:name, :description, :duration, :amount)
  end
end
