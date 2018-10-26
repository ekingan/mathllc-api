class V2::ClientsController < ApplicationController
  def index
    json_response({ message: 'Hello there'})
  end
end
