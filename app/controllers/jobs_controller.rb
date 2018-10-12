class JobsController < ApplicationController
  before_action :set_client
  before_action :set_client_job, only: [:show, :update, :destroy]

  # GET /clients/:client_id/items
  def index
    json_response(@client.jobs)
  end

  # GET /clients/:client_id/jobs/:id
  def show
    json_response(@job)
  end

  # POST /clients/:client_id/jobs
  def create
    @client.jobs.create!(job_params)
    json_response(@client, :created)
  end

  # PUT /clients/:client_id/jobs/:id
  def update
    @job.update(job_params)
    head :no_content
  end

  # DELETE /clients/:client_id/jobs/:id
  def destroy
    @job.destroy
    head :no_content
  end

  private

  def job_params
    params.permit(:form, :states, :status, :printed, :scanned, :uploaded, :filed, :accepted, 
      :rejected, :notes, :job_type, :price, :confirm_ack, :paid_in_full)
  end

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_client_job
    @job = @client.jobs.find_by!(id: params[:id]) if @client
  end
end
