class PassTemplatesController < ApplicationController
  before_action :set_pass_template, only: %i[ show edit update destroy ]

  # GET /pass_templates or /pass_templates.json
  def index
    @pass_templates = PassTemplate.all
  end

  # GET /pass_templates/1 or /pass_templates/1.json
  def show
  end

  # GET /pass_templates/new
  def new
    @pass_template = PassTemplate.new
  end

  # GET /pass_templates/1/edit
  def edit
  end

  # POST /pass_templates or /pass_templates.json
  def create
    @pass_template = PassTemplate.new(pass_template_params)

    respond_to do |format|
      if @pass_template.save
        format.html { redirect_to pass_template_url(@pass_template), notice: "Pass template was successfully created." }
        format.json { render :show, status: :created, location: @pass_template }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pass_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pass_templates/1 or /pass_templates/1.json
  def update
    respond_to do |format|
      if @pass_template.update(pass_template_params)
        format.html { redirect_to pass_template_url(@pass_template), notice: "Pass template was successfully updated." }
        format.json { render :show, status: :ok, location: @pass_template }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pass_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pass_templates/1 or /pass_templates/1.json
  def destroy
    @pass_template.destroy

    respond_to do |format|
      format.html { redirect_to pass_templates_url, notice: "Pass template was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pass_template
      @pass_template = PassTemplate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pass_template_params
      params.require(:pass_template).permit(:account_id, :platform, :kind)
    end
end
