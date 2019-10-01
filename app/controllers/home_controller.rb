class HomeController < ApplicationController
  def index
    @documents = Document.all
    render json: @documents
  end
end
