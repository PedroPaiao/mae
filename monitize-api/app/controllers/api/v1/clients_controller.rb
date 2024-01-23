class Api::V1::ClientsController < Api::ApiController
  def index
    render json: paginate(Client.all, ClientSerializer), status: :ok
  end

  def show
    render json: Client.find_by(id: params[:id]), status: :ok
  end

  def create
    client = Client.create(client_params)
    render json: client, status: :created
  end

  def update
    client = Client.find_by(id: params[:id])
    client.update(client_params)
    render json: client, status: :created
  end

  def destroy
    client = Client.find_by(id: params[:id])
    client.destroy
    render json: { message: "Removido com sucesso" }, status: :ok
  end

  private

  def client_params
    params.permit(:name, :phone, :address)
  end
end
