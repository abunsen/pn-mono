class PassTemplateFieldsController < ApplicationController
  before_action :set_pass_template_field, only: %i[ show edit update destroy ]

  # GET /pass_template_fields or /pass_template_fields.json
  def index
    @pass_template_fields = PassTemplateField.all
  end

  # GET /pass_template_fields/1 or /pass_template_fields/1.json
  def show
  end

  # GET /pass_template_fields/new
  def new
    @pass_template_field = PassTemplateField.new
  end

  # GET /pass_template_fields/1/edit
  def edit
  end

  # POST /pass_template_fields or /pass_template_fields.json
  def create
    @pass_template_field = PassTemplateField.new(pass_template_field_params)

    respond_to do |format|
      if @pass_template_field.save
        format.html { redirect_to pass_template_field_url(@pass_template_field), notice: "Pass template field was successfully created." }
        format.json { render :show, status: :created, location: @pass_template_field }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pass_template_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pass_template_fields/1 or /pass_template_fields/1.json
  def update
    respond_to do |format|
      if @pass_template_field.update(pass_template_field_params)
        format.html { redirect_to pass_template_field_url(@pass_template_field), notice: "Pass template field was successfully updated." }
        format.json { render :show, status: :ok, location: @pass_template_field }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pass_template_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pass_template_fields/1 or /pass_template_fields/1.json
  def destroy
    @pass_template_field.destroy

    respond_to do |format|
      format.html { redirect_to pass_template_fields_url, notice: "Pass template field was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pass_template_field
      @pass_template_field = PassTemplateField.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pass_template_field_params
      params.require(:pass_template_field).permit(:name, :description, :path, :default_value, :pass_template_id)
    end
end
