class BillingLedgersController < ApplicationController
  before_action :set_billing_ledger, only: %i[ show edit update destroy ]

  # GET /billing_ledgers or /billing_ledgers.json
  def index
    @billing_ledgers = BillingLedger.all
  end

  # GET /billing_ledgers/1 or /billing_ledgers/1.json
  def show
  end

  # GET /billing_ledgers/new
  def new
    @billing_ledger = BillingLedger.new
  end

  # GET /billing_ledgers/1/edit
  def edit
  end

  # POST /billing_ledgers or /billing_ledgers.json
  def create
    @billing_ledger = BillingLedger.new(billing_ledger_params)

    respond_to do |format|
      if @billing_ledger.save
        format.html { redirect_to billing_ledger_url(@billing_ledger), notice: "Billing ledger was successfully created." }
        format.json { render :show, status: :created, location: @billing_ledger }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @billing_ledger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /billing_ledgers/1 or /billing_ledgers/1.json
  def update
    respond_to do |format|
      if @billing_ledger.update(billing_ledger_params)
        format.html { redirect_to billing_ledger_url(@billing_ledger), notice: "Billing ledger was successfully updated." }
        format.json { render :show, status: :ok, location: @billing_ledger }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @billing_ledger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billing_ledgers/1 or /billing_ledgers/1.json
  def destroy
    @billing_ledger.destroy

    respond_to do |format|
      format.html { redirect_to billing_ledgers_url, notice: "Billing ledger was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing_ledger
      @billing_ledger = BillingLedger.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def billing_ledger_params
      params.require(:billing_ledger).permit(:account_id, :event_name, :properties, :amount, :payment_method_id, :issued_pass_id, :memo)
    end
end
