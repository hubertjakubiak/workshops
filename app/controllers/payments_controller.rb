class PaymentsController < ApplicationController

  expose :payments
  expose(:payment, attributes: :payment_params)
  expose(:student_payments) { student.payments }


  def create
    if payment.save
      redirect_to payments_path, notice: I18n.t('shared.created', resource: 'Payment')
    else
      render :new
    end
  end

  def update
    if payment.save
      redirect_to payment_path(payment), notice: I18n.t('shared.updated', resource: 'Payment')
    else
      render :edit
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :description, :student_id, :date)
  end

end
