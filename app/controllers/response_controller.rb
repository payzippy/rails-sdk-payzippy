require 'lib/charging/charging_response.rb'
class ResponseController < ApplicationController
  include ChargingResponse

  def response_display
# This file corresponds to your Charging Response Callback URL.

    @response_params = params
    # Incoming data can also be retrieved in the following manner using response_controller.rb or else in views we can display using @response_params array.

# To check the validity of the response, call the validate function on
# the ChargingResponse object. It verifies the hash returned in the response.
    @hash = validate()

    @transaction_status = get_transaction_status()
    @merchant_id = get_merchant_id
    @merchant_key_id = get_merchant_key_id
    @merchant_transaction_id = get_merchant_transaction_id
    @payzippy_transaction_id = get_payzippy_transaction_id
    @transaction_status = get_transaction_status
    @transaction_response_code = get_transaction_response_code
    @transaction_response_message = get_transaction_response_message
    @payment_method = get_payment_method
    @bank_name = get_bank_name
    @emi_months = get_emi_months
    @transaction_amount = get_transaction_amount
    @transaction_currency = get_transaction_currency
    @transaction_time = get_transaction_time
    @fraud_action = get_fraud_action
    @fraud_details = get_fraud_details
    @is_international= get_is_international
    @version = get_version
    @udf1 = get_udf1
    @udf2 = get_udf2
    @udf3 = get_udf3
    @udf4 = get_udf4
    @udf5 = get_udf5
    @hash_method = get_hash_method
    @hash = get_hash

  end


end

