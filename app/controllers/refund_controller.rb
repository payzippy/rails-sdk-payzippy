require 'lib/refund/refund_request.rb'
class RefundController < ApplicationController
  include RefundRequest

  def index

    @params = params
    set_merchant_key_id(params[:merchant_key_id])
    set_payzippy_sale_transaction_id(params[:payzippy_sale_transaction_id])
    set_merchant_transaction_id(params[:merchant_transaction_id])
    set_hash_method(params[:hash_method])
    set_refund_amount(params[:refund_amount])
    set_refund_reason(params[:refund_reason])
    set_refunded_by(params[:refunded_by])
    set_udf1(params[:udf1])
    set_udf2(params[:udf2])
    set_udf3(params[:udf3])
    set_udf4(params[:udf4])
    set_udf5(params[:udf5])

    @pz_refund_response = refund()

    if @error_message == 'No Error in validation'
      @validate_refund = validate_refund()

      @status_code = get_status_code()
      @status_message = get_status_message()
      @error_code = get_error_code()
      @error_message = get_error_message()
      @merchant_id = get_merchant_id()
      @merchant_key_id = get_merchant_key_id()
      @hash_method = get_hash_method()
      @hash = get_hash()

      @merchant_transaction_id = get_merchant_transaction_id()
      @payzippy_transaction_id = get_payzippy_transaction_id()
      @bank_arn = get_bank_arn()
      @refund_amount = get_refund_amount()
      @refund_currency = get_currency()
      @transaction_time = get_transaction_time()
      @refund_status = get_refund_status()
      @refund_response_code = get_refund_response_code()
      @refund_response_message = get_refund_response_message()
      @udf1 = get_udf1()
      @udf2 = get_udf2()
      @udf3 = get_udf3()
      @udf4 = get_udf4()
      @udf5 = get_udf5()
    end #for error if
  end
end
