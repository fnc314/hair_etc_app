class ClientsController < ApplicationController

  def index
  end

  def show
    @client = current_client
  end

end
