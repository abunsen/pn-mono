class IssuedPassesController < ApplicationController
  before_action :set_issued_pass, only: %i[ show edit update destroy ]

  # GET /issued_passes or /issued_passes.json
  def index
    @issued_passes = IssuedPass.all
  end

  # GET /issued_passes/1 or /issued_passes/1.json
  def show
  end

  # GET /issued_passes/new
  def new
    @issued_pass = IssuedPass.new
  end

  # GET /issued_passes/1/edit
  def edit
  end

  # POST /issued_passes or /issued_passes.json
  def create
    @issued_pass = IssuedPass.new(issued_pass_params)

    respond_to do |format|
      if @issued_pass.save
        format.html { redirect_to issued_pass_url(@issued_pass), notice: "Issued pass was successfully created." }
        format.json { render :show, status: :created, location: @issued_pass }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @issued_pass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issued_passes/1 or /issued_passes/1.json
  def update
    respond_to do |format|
      if @issued_pass.update(issued_pass_params)
        format.html { redirect_to issued_pass_url(@issued_pass), notice: "Issued pass was successfully updated." }
        format.json { render :show, status: :ok, location: @issued_pass }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @issued_pass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issued_passes/1 or /issued_passes/1.json
  def destroy
    @issued_pass.destroy

    respond_to do |format|
      format.html { redirect_to issued_passes_url, notice: "Issued pass was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issued_pass
      @issued_pass = IssuedPass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issued_pass_params
      params.require(:issued_pass).permit(:pass_template_id, :issue_date, :install_date, :install_ip, :install_user_agent, :delivered_via, :delivered_date)
    end
end
