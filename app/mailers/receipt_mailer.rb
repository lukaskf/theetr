class ReceiptMailer < ApplicationMailer
  def receipt_email
    @receipt = Receipt.find params[:receipt_id]
    mail(to: @receipt.customer_email, subject: 'Your theetr Movie Ticket Receipt')
  end
end
