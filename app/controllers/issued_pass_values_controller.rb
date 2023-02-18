class IssuedPassValuesController < ApplicationController
  before_action :set_issued_pass_value, only: %i[ show edit update destroy ]

  # GET /issued_pass_values or /issued_pass_values.json
  def index
    @issued_pass_values = IssuedPassValue.all
  end

  # GET /issued_pass_values/1 or /issued_pass_values/1.json
  def show
  end

  # GET /issued_pass_values/new
  def new
    @issued_pass_value = IssuedPassValue.new
  end

  # GET /issued_pass_values/1/edit
  def edit
  end

  # POST /issued_pass_values or /issued_pass_values.json
  def create
    @issued_pass_value = IssuedPassValue.new(issued_pass_value_params)

    respond_to do |format|
      if @issued_pass_value.save
        format.html { redirect_to issued_pass_value_url(@issued_pass_value), notice: "Issued pass value was successfully created." }
        format.json { render :show, status: :created, location: @issued_pass_value }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @issued_pass_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issued_pass_values/1 or /issued_pass_values/1.json
  def update
    respond_to do |format|
      if @issued_pass_value.update(issued_pass_value_params)
        format.html { redirect_to issued_pass_value_url(@issued_pass_value), notice: "Issued pass value was successfully updated." }
        format.json { render :show, status: :ok, location: @issued_pass_value }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @issued_pass_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issued_pass_values/1 or /issued_pass_values/1.json
  def destroy
    @issued_pass_value.destroy

    respond_to do |format|
      format.html { redirect_to issued_pass_values_url, notice: "Issued pass value was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issued_pass_value
      @issued_pass_value = IssuedPassValue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issued_pass_value_params
      params.require(:issued_pass_value).permit(:issued_pass_id, :path, :value)
    end
end
