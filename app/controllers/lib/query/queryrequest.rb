require 'lib/config.rb'
require 'net/http'
require 'lib/utils.rb'
require 'lib/constants.rb'
require 'lib/query/queryresponse.rb'

module QueryRequest
  include PZ_Constants
  include PZ_Config
  include PZ_Utils
  include QueryResponse

  def initialize
    @query_params = Hash.new { |hash, key| hash[key] = Array.new }

    set_merchant_id(PZ_Config::MERCHANT_ID)
    set_merchant_key_id(PZ_Config::MERCHANT_KEY_ID)
    set_hash_method(PZ_Config::HASH_METHOD)
    @query_api_url = PZ_Config::API_BASE + PZ_Config::API_QUERY + '/' + PZ_Config::API_VERSION
  end

  def set_merchant_id(value)
    @query_params[PZ_Constants::PARAMETER_MERCHANT_ID] = value
  end

  def set_merchant_key_id(value)
    @query_params[PZ_Constants::PARAMETER_MERCHANT_KEY_ID] = value
  end

  def set_merchant_transaction_id(value)
    @query_params[PZ_Constants::PARAMETER_MERCHANT_TRANSACTION_ID] = value
  end

  def set_payzippy_transaction_id(value)
    @query_params[PZ_Constants::PARAMETER_PAYZIPPY_TRANSACTION_ID] = value
  end

  def set_transaction_type(value)
    @query_params[PZ_Constants::PARAMETER_TRANSACTION_TYPE] = value
  end

  def set_hash_method(value)
    @query_params[PZ_Constants::PARAMETER_HASH_METHOD] = value
  end

  def set_hash(value)
    @query_params[PZ_Constants::PARAMETER_HASH] = value
  end

  def validate()
    unless is_valid_parameter(@query_params[PZ_Constants::PARAMETER_MERCHANT_ID], PZ_Constants::MAX_LEN_MERCHANT_ID)

      @query_error_message = PZ_Constants::INVALID_MERCHANT_ID
      return false

    end

    unless is_valid_parameter(@query_params[PZ_Constants::PARAMETER_MERCHANT_KEY_ID], PZ_Constants::MAX_LEN_MERCHANT_KEY_ID)

      @query_error_message = PZ_Constants::INVALID_MERCHANT_KEY_ID
      return false

    end

    unless is_valid_parameter(@query_params[PZ_Constants::PARAMETER_HASH_METHOD])

      @query_error_message = PZ_Constants::INVALID_HASH_METHOD
      return false

    end

    pz_transaction_id_set = true
    merchant_transaction_id_set = true

    if !@query_params.has_key?(PZ_Constants::PARAMETER_PAYZIPPY_TRANSACTION_ID) or !is_valid_parameter(@query_params[PZ_Constants::PARAMETER_PAYZIPPY_TRANSACTION_ID])

      pz_transaction_id_set = false

    end

    if !@query_params.has_key?(PZ_Constants::PARAMETER_MERCHANT_TRANSACTION_ID) or !is_valid_parameter(@query_params[PZ_Constants::PARAMETER_MERCHANT_TRANSACTION_ID])

      merchant_transaction_id_set = false

    end

    if !(pz_transaction_id_set or merchant_transaction_id_set)

      @query_error_message = PZ_Constants::INVALID_TRANSACTION_ID

    end

    if @query_params.has_key?(PZ_Constants::PARAMETER_TRANSACTION_TYPE) && @query_params[PZ_Constants::PARAMETER_TRANSACTION_TYPE].length > PZ_Constants::MAX_LEN_TRANSACTION_TYPE

      @query_error_message = PZ_Constants::INVALID_TRANSACTION_TYPE

    end
    @query_error_message = true

  end

  def get_query_url()
    validate_result = validate()
    if !validate_result
      abort(@query_error_message)
    end
    hash = generate_hash(@query_params)
    set_hash(hash)
    @query_url = @query_api_url + "?"
    @query_params.each do |key, val|
      @query_url << "#{key}=#{val}&"
    end
    @query_url = URI::encode(@query_url)

    return @query_url
  end

  def get_request_params()
    return @query_params
  end

  def query()
    @get_query_url = get_query_url()
    @received_params = RestClient::Request.new({:method => :post, :url => @get_query_url}).execute
    return query_response(@received_params)
  end
end
