module Api
  module V1
    class ArtistsController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :authorize_access_request!, except: [:index, :show]
      before_action :set_artist, only: [:show, :edit, :update, :destroy]
  
      # GET /artists
      def index
        @artists = Artist.all
  
        render json: @artists
      end
  
      # GET /artists/1
      def show
        render json: @artist
      end
  
      # POST /artists
      def create
        @artist = Artist.new(artist_params)
  
        if @artist.save
          render json: @artist, status: :created
        else
          render json: @artist.errors, status: :unprocessable_entity
        end
      end
  
      # PATCH/PUT /artists/1
      def update
        if @artist.update(artist_params)
          render json: @artist
        else
          render json: @artist.errors, status: :unprocessable_entity
        end
      end
  
      # DELETE /artists/1
      def destroy
        @artist.destroy
      end
  
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_artist
          @artist = Artist.find(params[:id])
        end
  
        # Never trust parameters from the scary internet, only allow the white list through.
        def artist_params
          params.require(:artist).permit(:name)
        end
    end
  end
end
