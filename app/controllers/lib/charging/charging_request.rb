require 'lib/constants.rb'
require 'lib/utils.rb'
require 'lib/config.rb'
module ChargingRequest
  include PZ_Constants
  include PZ_Utils
  include PZ_Config

# =======================================================
# Mandatory parameters initialized by Merchant/ PZ_Config
# =======================================================

  def set_merchant_id value
    @param = Hash.new { |hash, key| hash[key] = Array.new }
    @param[PZ_Constants::PARAMETER_MERCHANT_ID] = value
  end

  def set_merchant_key_id value
    @param[PZ_Constants::PARAMETER_MERCHANT_KEY_ID] = value
  end

  def set_transaction_type value
    @param[PZ_Constants::PARAMETER_TRANSACTION_TYPE] = value
  end

  def set_currency value
    @param[PZ_Constants::PARAMETER_CURRENCY] = value
  end

  def set_ui_mode value
    @param[PZ_Constants::PARAMETER_UI_MODE] = value
  end

  def set_hash_method value
    @param[PZ_Constants::PARAMETER_HASH_METHOD] = value
  end

  def set_hash value
    @param[PZ_Constants::PARAMETER_HASH] = value
  end

  def set_callback_url value
    @param[PZ_Constants::PARAMETER_CALLBACK_URL] = value
  end


  # ==========================================================
  # Mandatory parameters need to be initialized by Application
  # ==========================================================

  def set_buyer_email_address value
    @param[PZ_Constants::PARAMETER_BUYER_EMAIL_ADDRESS] = value
  end

  def set_merchant_transaction_id value
    @param[PZ_Constants::PARAMETER_MERCHANT_TRANSACTION_ID] = value
  end

  def set_transaction_amount value
    @param[PZ_Constants::PARAMETER_TRANSACTION_AMOUNT] = value
  end

  def set_payment_method value
    @param[PZ_Constants::PARAMETER_PAYMENT_METHOD] = value
  end


  # ===============================================
  # Optional parameters related to merchant details
  # ===============================================


  def set_terminal_id value
    @param[PZ_Constants::PARAMETER_TERMINAL_ID] = value
  end

  def set_udf1 value
    @param[PZ_Constants::PARAMETER_UDF1] = value
  end

  def set_udf2 value
    @param[PZ_Constants::PARAMETER_UDF2] = value
  end

  def set_udf3 value
    @param[PZ_Constants::PARAMETER_UDF3] = value
  end

  def set_udf4 value
    @param[PZ_Constants::PARAMETER_UDF4] = value
  end

  def set_udf5 value
    @param[PZ_Constants::PARAMETER_UDF5] = value
  end


  # ============================================
  # Optional parameters related to buyer details
  # ============================================


  def set_buyer_phone_no value
    @param[PZ_Constants::PARAMETER_BUYER_PHONE_NO] = value
  end

  def set_buyer_unique_id value
    @param[PZ_Constants::PARAMETER_BUYER_UNIQUE_ID] = value
  end

  def set_shipping_address value
    @param[PZ_Constants::PARAMETER_SHIPPING_ADDRESS] = value
  end

  def set_shipping_city value
    @param[PZ_Constants::PARAMETER_SHIPPING_CITY] = value
  end

  def set_shipping_state value
    @param[PZ_Constants::PARAMETER_SHIPPING_STATE] = value
  end

  def set_shipping_zip value
    @param[PZ_Constants::PARAMETER_SHIPPING_ZIP] = value
  end

  def set_shipping_country value
    @param[PZ_Constants::PARAMETER_SHIPPING_COUNTRY] = value
  end

  # ==================================================
  # Optional parameters related to transaction details
  # ==================================================


  def set_emi_months value
    @param[PZ_Constants::PARAMETER_EMI_MONTHS] = value
  end

  def set_bank_name value
    @param[PZ_Constants::PARAMETER_BANK_NAME] = value
  end


  # ==================================================
  # Optional parameters related to the product details
  # ==================================================


  def set_source value
    @param[PZ_Constants::PARAMETER_SOURCE] = value
  end

  def set_product_info1 value
    @param[PZ_Constants::PARAMETER_PRODUCT_INFO1] = value
  end

  def set_product_info2 value
    @param[PZ_Constants::PARAMETER_PRODUCT_INFO2] = value
  end

  def set_product_info3 value
    @param[PZ_Constants::PARAMETER_PRODUCT_INFO3] = value
  end

  # ==============================================
  # Optional parameters related to billing details
  # ==============================================


  def set_billing_name value
    @param[PZ_Constants::PARAMETER_BILLING_NAME] = value
  end

  def set_billing_address value
    @param[PZ_Constants::PARAMETER_BILLING_ADDRESS] = value
  end

  def set_billing_city value
    @param[PZ_Constants::PARAMETER_BILLING_CITY] = value
  end

  def set_billing_state value
    @param[PZ_Constants::PARAMETER_BILLING_STATE] = value
  end

  def set_billing_zip value
    @param[PZ_Constants::PARAMETER_BILLING_ZIP] = value
  end

  def set_billing_country value
    @param[PZ_Constants::PARAMETER_BILLING_COUNTRY] = value
  end

  # ==============================================
  # Optional parameters useful for fraud detection
  # ==============================================


  def set_min_sla value
    @param[PZ_Constants::PARAMETER_MIN_SLA] = value
  end

  def set_is_user_logged_in value
    @param[PZ_Constants::PARAMETER_IS_USER_LOGGED_IN] = value
  end

  def set_address_count value
    @param[PZ_Constants::PARAMETER_ADDRESS_COUNT] = value
  end

  def set_sales_channel value
    @param[PZ_Constants::PARAMETER_SALES_CHANNEL] = value
  end

  def set_item_total value
    @param[PZ_Constants::PARAMETER_ITEM_TOTAL] = value
  end

  def set_item_vertical value
    @param[PZ_Constants::PARAMETER_ITEM_VERTICAL] = value
  end

  def set_sms_notify_number value
    @param[PZ_Constants::PARAMETER_SMS_NOTIFY_NUMBER] = value
  end

  def validate
    unless is_valid_parameter(@param[PZ_Constants::PARAMETER_MERCHANT_ID], PZ_Constants::MAX_LEN_MERCHANT_ID)
      @error_message = PZ_Constants::INVALID_MERCHANT_ID
      return false
    end

    unless is_valid_parameter(@param[PZ_Constants::PARAMETER_BUYER_EMAIL_ADDRESS], PZ_Constants::MAX_LEN_EMAIL)
      @error_message = PZ_Constants::INVALID_EMAIL_ADDRESS
      return false
    end

    unless is_valid_parameter(@param[PZ_Constants::PARAMETER_MERCHANT_TRANSACTION_ID], PZ_Constants::MAX_LEN_TRANSACTION_ID)
      @error_message = PZ_Constants::INVALID_MERCHANT_TRANSACTION_ID
      return false
    end

    unless is_valid_parameter(@param[PZ_Constants::PARAMETER_TRANSACTION_TYPE])
      @error_message = PZ_Constants::INVALID_TRANSACTION_TYPE
      return false
    end

    #unless is_valid_parameter(@param[PZ_Constants::PARAMETER_TRANSACTION_AMOUNT])
    unless (@param[PZ_Constants::PARAMETER_TRANSACTION_AMOUNT].to_i == @param[PZ_Constants::PARAMETER_TRANSACTION_AMOUNT].to_f) or !(@param[PZ_Constants::PARAMETER_TRANSACTION_AMOUNT].to_s.to_i.to_s == @param[PZ_Constants::PARAMETER_TRANSACTION_AMOUNT].to_s) or @param[PZ_Constants::PARAMETER_TRANSACTION_AMOUNT].to_i <= 0
      @error_message = PZ_Constants::INVALID_TRANSACTION_AMOUNT
      return false
    end

    unless is_valid_parameter(@param[PZ_Constants::PARAMETER_PAYMENT_METHOD])
      @error_message = PZ_Constants::INVALID_PAYMENT_METHOD
      return false
    end

    unless is_valid_parameter(@param[PZ_Constants::PARAMETER_CURRENCY])
      @error_message = PZ_Constants::INVALID_CURRENCY
      return false
    end

    unless is_valid_parameter(@param[PZ_Constants::PARAMETER_UI_MODE])
      @error_message = PZ_Constants::INVALID_UI_MODE
      return false
    end

    unless is_valid_parameter(@param[PZ_Constants::PARAMETER_HASH_METHOD])
      @error_message = PZ_Constants::INVALID_HASH_METHOD
      return false
    end

    unless is_valid_parameter(@param[PZ_Constants::PARAMETER_MERCHANT_KEY_ID], PZ_Constants::MAX_LEN_MERCHANT_KEY_ID)
      @error_message = PZ_Constants::INVALID_MERCHANT_KEY_ID
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_BUYER_PHONE_NO) && (@param[PZ_Constants::PARAMETER_BUYER_PHONE_NO].length > PZ_Constants::MAX_LEN_BUYER_PHONE_NO or !(@param[PZ_Constants::PARAMETER_BUYER_PHONE_NO].to_s.to_i.to_s == @param[PZ_Constants::PARAMETER_BUYER_PHONE_NO].to_s))
      @error_message = PZ_Constants::INVALID_BUYER_PHONE_NO
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_BUYER_UNIQUE_ID) && @param[PZ_Constants::PARAMETER_BUYER_UNIQUE_ID].length > PZ_Constants::MAX_LEN_BUYER_UNIQUE_ID
      @error_message = PZ_Constants::INVALID_BUYER_UNIQUE_ID
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_SHIPPING_ADDRESS) && @param[PZ_Constants::PARAMETER_SHIPPING_ADDRESS].length > PZ_Constants::MAX_LEN_SHIPPING_ADDRESS
      @error_message = PZ_Constants::INVALID_SHIPPING_ADDRESS
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_SHIPPING_ZIP) && @param[PZ_Constants::PARAMETER_SHIPPING_ZIP].length > PZ_Constants::MAX_LEN_SHIPPING_ZIP
      @error_message = PZ_Constants::INVALID_SHIPPING_ZIP
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_SHIPPING_COUNTRY) && @param[PZ_Constants::PARAMETER_SHIPPING_COUNTRY].length > PZ_Constants::MAX_LEN_SHIPPING_COUNTRY
      @error_message = PZ_Constants::INVALID_SHIPPING_COUNTRY
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_SOURCE) && @param[PZ_Constants::PARAMETER_SOURCE].length > PZ_Constants::MAX_LEN_SOURCE
      @error_message = PZ_Constants::INVALID_SOURCE
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_CALLBACK_URL) && @param[PZ_Constants::PARAMETER_CALLBACK_URL].length > PZ_Constants::MAX_LEN_CALLBACK_URL
      @error_message = PZ_Constants::INVALID_CALLBACK_URL
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_BILLING_NAME) && @param[PZ_Constants::PARAMETER_BILLING_NAME].length > PZ_Constants::MAX_LEN_BILLING_NAME
      @error_message = PZ_Constants::INVALID_BILLING_NAME
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_BILLING_ADDRESS) && @param[PZ_Constants::PARAMETER_BILLING_ADDRESS].length > PZ_Constants::MAX_LEN_BILLING_ADDRESS
      @error_message = PZ_Constants::INVALID_BILLING_ADDRESS
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_BILLING_ZIP) && @param[PZ_Constants::PARAMETER_BILLING_ZIP].length > PZ_Constants::MAX_LEN_BILLING_ZIP
      @error_message = PZ_Constants::INVALID_BILLING_ZIP
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_PRODUCT_INFO1) && @param[PZ_Constants::PARAMETER_PRODUCT_INFO1].length > PZ_Constants::MAX_LEN_PRODUCT_INFO1
      @error_message = PZ_Constants::INVALID_PRODUCT_INFO1
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_PRODUCT_INFO2) && @param[PZ_Constants::PARAMETER_PRODUCT_INFO2].length > PZ_Constants::MAX_LEN_PRODUCT_INFO2
      @error_message = PZ_Constants::INVALID_PRODUCT_INFO2
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_PRODUCT_INFO3) && @param[PZ_Constants::PARAMETER_PRODUCT_INFO3].length > PZ_Constants::MAX_LEN_PRODUCT_INFO3
      @error_message = PZ_Constants::INVALID_PRODUCT_INFO3
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_ITEM_TOTAL) && @param[PZ_Constants::PARAMETER_ITEM_TOTAL].length > PZ_Constants::MAX_LEN_ITEM_TOTAL
      @error_message = PZ_Constants::INVALID_ITEM_TOTAL
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_ITEM_VERTICAL) && @param[PZ_Constants::PARAMETER_ITEM_VERTICAL].length > PZ_Constants::MAX_LEN_ITEM_VERTICAL
      @error_message = PZ_Constants::INVALID_ITEM_VERTICAL
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_TIMEGMT) && @param[PZ_Constants::PARAMETER_TIMEGMT].length > PZ_Constants::MAX_LEN_TIMEGMT
      @error_message = PZ_Constants::INVALID_TIMEGMT
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_UDF1) && @param[PZ_Constants::PARAMETER_UDF1].length > PZ_Constants::MAX_LEN_UDF1
      @error_message = PZ_Constants::INVALID_UDF1
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_UDF2) && @param[PZ_Constants::PARAMETER_UDF2].length > PZ_Constants::MAX_LEN_UDF2
      @error_message = PZ_Constants::INVALID_UDF2
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_UDF3) && @param[PZ_Constants::PARAMETER_UDF3].length > PZ_Constants::MAX_LEN_UDF3
      @error_message = PZ_Constants::INVALID_UDF3
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_UDF4) && @param[PZ_Constants::PARAMETER_UDF4].length > PZ_Constants::MAX_LEN_UDF4
      @error_message = PZ_Constants::INVALID_UDF4
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_UDF5) && @param[PZ_Constants::PARAMETER_UDF5].length > PZ_Constants::MAX_LEN_UDF5
      @error_message = PZ_Constants::INVALID_UDF5
      return false
    end

    if @param.has_key?(PZ_Constants::PARAMETER_TERMINAL_ID) && @param[PZ_Constants::PARAMETER_TERMINAL_ID].length > PZ_Constants::MAX_LEN_TERMINAL_ID
      @error_message = PZ_Constants::INVALID_TERMINAL_ID
      return false
    end

    return true
  end

  def charge()
    response = Hash.new { |hash, key| hash[key] = Array.new }
    response = {
        "status" => "ERROR",
        "error_message" => "",
        "url" => "",
        "params" => ""
    }

    validate_result = validate()

    unless validate_result
      response["error_message"] = @error_message
    end

    hash = generate_hash(@param)
    set_hash(hash)

    if @param[PZ_Constants::PARAMETER_UI_MODE] == 'IFRAME'
      response["url"] = get_charging_api_url() + "?"
      @param.each do |key, val|
        response["url"] << "#{key}=#{val}&"
      end
      response["url"] = URI::encode(response["url"])
      response["url"] = URI::encode(response["url"], '+')

    elsif @param[PZ_Constants::PARAMETER_UI_MODE] == 'REDIRECT'
      response["url"] = get_charging_api_url()
      response["status"] = "OK"
    end
    return response
  end

  def get_charging_api_url
    return PZ_Config::API_BASE + PZ_Config::API_CHARGING + "/" + PZ_Config::API_VERSION
  end

end
