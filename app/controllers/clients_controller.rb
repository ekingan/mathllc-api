class ClientsController < ApplicationController

  before_action :set_client, only: [:show, :update, :destroy]

  # GET /clients
  def index
    @clients = current_user.clients
    json_response(@clients)
  end

  # POST /clients
  def create
    @client = current_user.clients.create!(client_params)
    json_response(@client, :created)
  end

  # GET /clients/:id
  def show
    json_response(@client)
  end

  # PUT /clients/:id
  def update
    @client.update(client_params)
    head :no_content
  end

  # DELETE /clients/:id
  def destroy
    @client.destroy
    head :no_content
  end

  private

  def client_params
    # whitelist params
    params.permit(:last_name, :first_name, :company, :date_of_birth, :email, :phone, :street, :city, :state, 
      :zip_code, :occupation, :entity_type, :tax_year_ends, :filing_status, :discontinue, :tax_id)
  end

  def set_client
    @client = Client.find(params[:id])
  end
end
