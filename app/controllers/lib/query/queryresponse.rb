require 'lib/utils.rb'
require 'lib/constants.rb'
require 'lib/query/querytransactionresponse.rb'

module QueryResponse
  include PZ_Utils
  include PZ_Constants
  include QueryTransactionResponse


  def query_response(response)

    @data_params = Hash.new { |hash, key| hash[key] = Array.new }
    @data_params = ActiveSupport::JSON.decode(response)

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

  def validate_response_hash()
    @hash_calc = generate_hash(get_response_params())
    hash_match = @hash_calc == get_hash() ? true : false
    return hash_match
  end

  def get_transaction_responses()
    return transaction_responses
  end

  def get_response_params()
    return @data_params
  end
end
