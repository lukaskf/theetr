class ReceiptsController < ApplicationController
  before_action :set_receipt, only: %i[ show edit update destroy ]

  # GET /receipts or /receipts.json
  def index
    @receipts = {'receipts' => Receipt.all}
  end

  def filtered
    @receipts = Receipt.all.group_by{ |receipt| receipt.showtime&.movie }
  end

  # GET /receipts/1 or /receipts/1.json
  def show
  end

  # GET /receipts/new
  def new
    @receipt = Receipt.new
    if params[:showtime_id].present?
      @receipt.showtime = Showtime.find params[:showtime_id]
    else
      raise 'Cannot create Receipt without Showtime ID'
    end
  end

  # GET /receipts/1/edit
  def edit
  end

  # POST /receipts or /receipts.json
  def create
    @receipt = Receipt.new(receipt_params)

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to '/', notice: "Purchase successful, enjoy #{@receipt.showtime.movie.title}!" }
        format.json { render :show, status: :created, location: @receipt }

        @receipt.showtime.seat_purchased!

        ReceiptMailer.with(receipt: @receipt).receipt_email.deliver_now

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipts/1 or /receipts/1.json
  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to @receipt, notice: "Receipt was successfully updated." }
        format.json { render :show, status: :ok, location: @receipt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1 or /receipts/1.json
  def destroy
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to receipts_url, notice: "Receipt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receipt_params
      params.require(:receipt).permit(:purchased_at, :credit_card_number, :credit_card_expiration, :customer_name, :customer_email, :showtime_id)
    end
end
