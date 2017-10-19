# frozen_string_literal: true

# Protected KidsController
class KidsController < ProtectedController
  before_action :set_kid, only: %i[show update destroy]

  # GET /kids
  def index
    @kids = Kid.all

    render json: @kids
  end

  # GET /kids/1
  def show
    render json: @kid
  end

  # POST /kids
  def create
    @kid = Kid.new(kid_params)

    if @kid.save
      render json: @kid, status: :created, location: @kid
    else
      render json: @kid.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kids/1
  def update
    if @kid.update(kid_params)
      render json: @kid
    else
      render json: @kid.errors, status: :unprocessable_entity
    end
  end

  # DELETE /kids/1
  def destroy
    @kid.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_kid
    @kid = Kid.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def kid_params
    params.require(:kid).permit(:first_name, :last_name, :image_url)
  end
end
