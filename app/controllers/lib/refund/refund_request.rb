require 'lib/utils.rb'
require 'lib/constants.rb'
require 'lib/config.rb'
require 'net/http'
require 'lib/refund/refund_response.rb'

module RefundRequest
  include PZ_Constants
  include PZ_Config
  include PZ_Utils
  include RefundResponse

  def initialize()
    @refund_params = Hash.new { |hash, key| hash[key] = Array.new }
    set_merchant_id(PZ_Config::MERCHANT_ID)
    set_merchant_key_id(PZ_Config::MERCHANT_KEY_ID)
    set_hash_method(PZ_Config::HASH_METHOD)

    @refund_api_url = PZ_Config::API_BASE + PZ_Config::API_REFUND + "/" + PZ_Config::API_VERSION
  end

  def set_merchant_id(value)
    @refund_params[PZ_Constants::PARAMETER_MERCHANT_ID] = value
  end

  def set_merchant_key_id(value)
    @refund_params[PZ_Constants::PARAMETER_MERCHANT_KEY_ID] = value
  end

  def set_hash_method(value)
    @refund_params[PZ_Constants::PARAMETER_HASH_METHOD] = value
  end

  def set_hash(value)
    @refund_params[PZ_Constants::PARAMETER_HASH] = value
  end

  def set_merchant_transaction_id(value)
    @refund_params[PZ_Constants::PARAMETER_MERCHANT_TRANSACTION_ID] = value
  end

  def set_payzippy_sale_transaction_id(value)
    @refund_params[PZ_Constants::PARAMETER_PAYZIPPY_SALE_TRANSACTION_ID] = value
  end

  def set_timegmt()
    @refund_params[PZ_Constants::PARAMETER_TIMEGMT] = round(microtime(true) * 1000)
  end

  def set_refund_amount(value)
    @refund_params[PZ_Constants::PARAMETER_REFUND_AMOUNT] = value
  end

  def set_refund_reason(value)
    @refund_params[PZ_Constants::PARAMETER_REFUND_REASON] = value
  end

  def set_refunded_by(value)
    @refund_params[PZ_Constants::PARAMETER_REFUNDED_BY] = value
  end

  def set_udf1(value)
    @refund_params[PZ_Constants::PARAMETER_UDF1] = value
  end

  def set_udf2(value)
    @refund_params[PZ_Constants::PARAMETER_UDF2] = value
  end

  def set_udf3(value)
    @refund_params[PZ_Constants::PARAMETER_UDF3] = value
  end

  def set_udf4(value)
    @refund_params[PZ_Constants::PARAMETER_UDF4] = value
  end

  def set_udf5(value)
    @refund_params[PZ_Constants::PARAMETER_UDF5] = value
  end

  def validate()
    unless is_valid_parameter(@refund_params[PZ_Constants::PARAMETER_MERCHANT_ID], PZ_Constants::MAX_LEN_MERCHANT_ID)

      @error_message = PZ_Constants::INVALID_MERCHANT_ID
      return false

    end

    unless is_valid_parameter(@refund_params[PZ_Constants::PARAMETER_MERCHANT_KEY_ID], PZ_Constants::MAX_LEN_MERCHANT_KEY_ID)

      @error_message = PZ_Constants::INVALID_MERCHANT_KEY_ID
      return false

    end

    if !is_valid_parameter(@refund_params[PZ_Constants::PARAMETER_HASH_METHOD]) or !@refund_params.has_key?(PZ_Constants::PARAMETER_HASH_METHOD)

      @error_message = PZ_Constants::INVALID_HASH_METHOD
      return false

    end

    if !(@refund_params[PZ_Constants::PARAMETER_REFUND_AMOUNT].to_i == @refund_params[PZ_Constants::PARAMETER_REFUND_AMOUNT].to_f) or !(@refund_params[PZ_Constants::PARAMETER_REFUND_AMOUNT].to_s.to_i.to_s == @refund_params[PZ_Constants::PARAMETER_REFUND_AMOUNT].to_s) or @refund_params[PZ_Constants::PARAMETER_REFUND_AMOUNT].to_i <= 0

      @error_message = PZ_Constants::INVALID_REFUND_AMOUNT
      return false

    end

    pz_transaction_id_set = true
    merchant_transaction_id_set = true

    if !@refund_params.has_key?(PZ_Constants::PARAMETER_PAYZIPPY_SALE_TRANSACTION_ID) or !is_valid_parameter(@refund_params[PZ_Constants::PARAMETER_PAYZIPPY_SALE_TRANSACTION_ID])

      pz_transaction_id_set = false

    end

    if !@refund_params.has_key?(PZ_Constants::PARAMETER_MERCHANT_TRANSACTION_ID) or !is_valid_parameter(@refund_params[PZ_Constants::PARAMETER_MERCHANT_TRANSACTION_ID])

      merchant_transaction_id_set = false

    end

    if !(pz_transaction_id_set or merchant_transaction_id_set)
            @error_message = PZ_Constants::INVALID_TRANSACTION_ID
            return false
        end

    if @refund_params.has_key?(PZ_Constants::PARAMETER_REFUNDED_BY) && @refund_params[PZ_Constants::PARAMETER_REFUNDED_BY].length > PZ_Constants::MAX_LEN_REFUNDED_BY

      @error_message = PZ_Constants::INVALID_REFUNDED_BY
      return false

    end

    if @refund_params.has_key?(PZ_Constants::PARAMETER_REFUND_REASON) && @refund_params[PZ_Constants::PARAMETER_REFUND_REASON].length > PZ_Constants::MAX_LEN_REFUND_REASON

      @error_message = PZ_Constants::INVALID_REFUND_REASON
      return false

    end

    if @refund_params.has_key?(PZ_Constants::PARAMETER_UDF1) && @refund_params[PZ_Constants::PARAMETER_UDF1].length > PZ_Constants::MAX_LEN_UDF1

      @error_message = PZ_Constants::INVALID_UDF1
      return false

    end

    if @refund_params.has_key?(PZ_Constants::PARAMETER_UDF2) && @refund_params[PZ_Constants::PARAMETER_UDF2].length > PZ_Constants::MAX_LEN_UDF2

      @error_message = PZ_Constants::INVALID_UDF2
      return false

    end

    if @refund_params.has_key?(PZ_Constants::PARAMETER_UDF3) && @refund_params[PZ_Constants::PARAMETER_UDF3].length > PZ_Constants::MAX_LEN_UDF3

      @error_message = PZ_Constants::INVALID_UDF3
      return false

    end

    if @refund_params.has_key?(PZ_Constants::PARAMETER_UDF4) && @refund_params[PZ_Constants::PARAMETER_UDF4].length > PZ_Constants::MAX_LEN_UDF4

      @error_message = PZ_Constants::INVALID_UDF4
      return false

    end

    if @refund_params.has_key?(PZ_Constants::PARAMETER_UDF5) && @refund_params[PZ_Constants::PARAMETER_UDF5].length > PZ_Constants::MAX_LEN_UDF5

      @error_message = PZ_Constants::INVALID_UDF5
      return false

    end

    @error_message = 'No Error in validation'
    return true
  end

  def get_refund_url()
    hash = generate_hash(@refund_params)
    set_hash(hash)
    @refund_url = @refund_api_url + "?"
    @refund_params.each do |key, val|
      @refund_url << "#{key}=#{val}&"
    end
    @refund_url = URI::encode(@refund_url)
    @refund_url = URI::encode(@refund_url, '+')
    return @refund_url
  end

  def refund()
    validate_result = validate()
    if validate_result
      @get_refund_url = get_refund_url()
      @received_params = RestClient::Request.new({:method => :post, :url => @get_refund_url}).execute
      return refund_response(@received_params)
    else
      return
    end
  end
end
