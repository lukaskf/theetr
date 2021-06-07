# Preview all emails at http://localhost:3000/rails/mailers/receipt_mailer
class ReceiptMailerPreview < ActionMailer::Preview

  def receipt_email
    # http://localhost:3000/rails/mailers/receipt_mailer/receipt_email
    receipt = Receipt.all.first
    ReceiptMailer.with(receipt: receipt).receipt_email
  end

end
