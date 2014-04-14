require 'lib/constants.rb'
require 'lib/utils.rb'
module ChargingResponse
  include PZ_Constants
  include PZ_Utils

  def get_merchant_id()
    @response_params[PZ_Constants::PARAMETER_MERCHANT_ID]
  end

  def get_merchant_key_id()
    @response_params[PZ_Constants::PARAMETER_MERCHANT_KEY_ID]
  end

  def get_merchant_transaction_id()
    @response_params[PZ_Constants::PARAMETER_MERCHANT_TRANSACTION_ID]
  end

  def get_payzippy_transaction_id()
    @response_params[PZ_Constants::PARAMETER_PAYZIPPY_TRANSACTION_ID]
  end

  def get_transaction_status()
    @response_params[PZ_Constants::PARAMETER_TRANSACTION_STATUS]
  end

  def get_transaction_response_code()
    @response_params[PZ_Constants::PARAMETER_TRANSACTION_RESPONSE_CODE]
  end

  def get_transaction_response_message()
    @response_params[PZ_Constants::PARAMETER_TRANSACTION_RESPONSE_MESSAGE]
  end

  def get_payment_method()
    @response_params[PZ_Constants::PARAMETER_PAYMENT_METHOD]
  end

  def get_bank_name()
    @response_params[PZ_Constants::PARAMETER_BANK_NAME]
  end

  def get_emi_months()
    emi_months_exists = @response_params.has_key?(PZ_Constants::PARAMETER_EMI_MONTHS)
    if (emi_months_exists)
      return @response_params[PZ_Constants::PARAMETER_EMI_MONTHS]
    end
    return 0
  end

  def get_transaction_amount()
    @response_params[PZ_Constants::PARAMETER_TRANSACTION_AMOUNT]
  end

  def get_transaction_time()
    @response_params[PZ_Constants::PARAMETER_TRANSACTION_TIME]
  end

  def get_transaction_currency()
    @response_params[PZ_Constants::PARAMETER_TRANSACTION_CURRENCY]
  end

  def get_fraud_action()
    @response_params[PZ_Constants::PARAMETER_FRAUD_ACTION]
  end

  def get_fraud_details()
    @response_params[PZ_Constants::PARAMETER_FRAUD_DETAILS]
  end

  def get_version()
    @response_params[PZ_Constants::PARAMETER_VERSION]
  end

  def get_udf1()
    @response_params[PZ_Constants::PARAMETER_UDF1]
  end

  def get_udf2()
    @response_params[PZ_Constants::PARAMETER_UDF2]
  end

  def get_udf3()
    @response_params[PZ_Constants::PARAMETER_UDF3]
  end

  def get_udf4()
    @response_params[PZ_Constants::PARAMETER_UDF4]
  end

  def get_udf5()
    @response_params[PZ_Constants::PARAMETER_UDF5]
  end

  def get_hash_method()
    @response_params[PZ_Constants::PARAMETER_HASH_METHOD]
  end

  def get_hash()
    @response_params[PZ_Constants::PARAMETER_HASH]
  end

  def get_is_international()
    @response_params[PZ_Constants::PARAMETER_IS_INTERNATIONAL]
  end

  def get_response_params()
    @response_params
  end

  def validate()
    @hash_value = generate_hash(get_response_params())
    @hash_match = @hash_value == get_hash() ? true : false
    return @hash_value
  end

  def is_transaction_successful()
    return get_transaction_status() == PZ_Constants::RESPONSE_SUCCESS
  end
end