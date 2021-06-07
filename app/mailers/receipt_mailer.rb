class ReceiptMailer < ApplicationMailer
  def receipt_email
    @receipt = params[:receipt]
    mail(to: @receipt.customer_email, subject: 'Your Theetr Movie Ticket Receipt')
  end
end
