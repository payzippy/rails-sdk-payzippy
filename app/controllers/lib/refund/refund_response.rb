require 'lib/utils.rb'
require 'lib/constants.rb'
require 'lib/refund/refund_transaction_response.rb'

module RefundResponse
  include PZ_Utils
  include PZ_Constants
  include RefundTransactionResponse


  def refund_response(response)
    @data_params = Hash.new { |hash, key| hash[key] = Array.new }
    @data_params = ActiveSupport::JSON.decode(response)
    @transaction_response = refund_transaction_response(@data_params["data"])
  end

  def get_status_code()
    return @data_params[PZ_Constants::PARAMETER_STATUS_CODE]
  end

  def get_status_message()
    return @data_params[PZ_Constants::PARAMETER_STATUS_MESSAGE]
  end

  def get_error_code()
    return @data_params[PZ_Constants::PARAMETER_ERROR_CODE]
  end

  def get_error_message()
    return @data_params[PZ_Constants::PARAMETER_ERROR_MESSAGE]
  end

  def get_merchant_id()
    return @data_params[PZ_Constants::PARAMETER_MERCHANT_ID]
  end

  def get_merchant_key_id()
    return @data_params[PZ_Constants::PARAMETER_MERCHANT_KEY_ID]
  end

  def get_hash_method()
    return @data_params[PZ_Constants::PARAMETER_HASH_METHOD]
  end

  def get_hash()
    return @data_params[PZ_Constants::PARAMETER_HASH]
  end

  def validate_refund()
    @hash_response = generate_hash(get_response_params())
    @hash_match = @hash_response == get_hash() ? true : false
    return @hash_match
  end

  def get_transaction_response()
    return @transaction_response
  end

  def get_response_params()
    return @data_params
  end
end
