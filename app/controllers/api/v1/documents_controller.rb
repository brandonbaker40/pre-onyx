module Api
  module V1
    class DocumentsController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_document, only: [:show, :update, :destroy]

      # GET /documents
      def index
        @documents = current_user.documents.all

        render json: @documents
      end

      # GET /documents/1
      def show
        render json: @document
      end

      # POST /documents
      def create
        @document = current_user.documents.build(document_params)

        if @document.save
          render json: @document, status: :created
        else
          render json: @document.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /documents/1
      def update
        if @document.update(document_params)
          render json: @document
        else
          render json: @document.errors, status: :unprocessable_entity
        end
      end

      # DELETE /documents/1
      def destroy
        @document.destroy
      end

      # comment

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_document
          @document = current_user.documents.find(params[:id])
        end

        def document_params
          params.require(:document).permit(:name)
        end
    end
  end
end
