require 'lib/utils.rb'
require 'lib/constants.rb'

module QueryTransactionResponse
  include PZ_Utils
  include PZ_Constants

  def query_transaction_response(response)
    @query_transaction_params = Hash.new { |hash, key| hash[key] = Array.new }
    @query_transaction_params = response
  end

  def get_merchant_transaction_id()
    return @query_transaction_params[PZ_Constants::PARAMETER_MERCHANT_TRANSACTION_ID]
  end

  def get_payzippy_transaction_id()
    return @query_transaction_params[PZ_Constants::PARAMETER_PAYZIPPY_TRANSACTION_ID]
  end

  def get_bank_arn()
    return @query_transaction_params[PZ_Constants::PARAMETER_BANK_ARN]
  end

  def get_transaction_amount()
    return @query_transaction_params[PZ_Constants::PARAMETER_TRANSACTION_AMOUNT]
  end

  def get_transaction_currency()
    return @query_transaction_params[PZ_Constants::PARAMETER_TRANSACTION_CURRENCY]
  end

  def get_transaction_time()
    return @query_transaction_params[PZ_Constants::PARAMETER_TRANSACTION_TIME]
  end

  def get_payment_method()
    return @query_transaction_params[PZ_Constants::PARAMETER_PAYMENT_METHOD]
  end

  def get_emi_months()
    return @query_transaction_params[PZ_Constants::PARAMETER_EMI_MONTHS]
  end

  def get_transaction_status()
    return @query_transaction_params[PZ_Constants::PARAMETER_TRANSACTION_STATUS]
  end

  def get_transaction_type()
    return @query_transaction_params[PZ_Constants::PARAMETER_TRANSACTION_TYPE]
  end

  def get_transaction_response_code()
    return @query_transaction_params[PZ_Constants::PARAMETER_TRANSACTION_RESPONSE_CODE]
  end

  def get_transaction_response_message()
    return @query_transaction_params[PZ_Constants::PARAMETER_TRANSACTION_RESPONSE_MESSAGE]
  end

  def get_fraud_action()
    return @query_transaction_params[PZ_Constants::PARAMETER_FRAUD_ACTION]
  end

  def get_fraud_details()
    return @query_transaction_params[PZ_Constants::PARAMETER_FRAUD_DETAILS]
  end

  def get_response_params()
    return @query_transaction_params
  end
end
