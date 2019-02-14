class KarmasController < ApplicationController
  before_action :set_karma, only: [:show, :update, :destroy]

  # GET /karmas
  def index
    @karmas = Karma.all

    render json: @karmas
  end

  # GET /karmas/1
  def show
    render json: @karma
  end

  # POST /karmas
  def create
    @karma = Karma.new(karma_params)

    if @karma.save
      render json: @karma, status: :created, location: @karma
    else
      render json: @karma.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /karmas/1
  def update
    if @karma.update(karma_params)
      render json: @karma
    else
      render json: @karma.errors, status: :unprocessable_entity
    end
  end

  # DELETE /karmas/1
  def destroy
    @karma.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_karma
      @karma = Karma.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def karma_params
      params.require(:karma).permit(:entry, :date)
    end
end
