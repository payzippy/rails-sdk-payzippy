require 'open-uri'
require 'lib/config.rb'
require 'lib/charging/charging_request.rb'
class ChargingController < ApplicationController
  include PZ_Config
  include ChargingRequest

  def charging_display
    set_merchant_id(PZ_Config::MERCHANT_ID)
    set_merchant_key_id(PZ_Config::MERCHANT_KEY_ID)
    set_callback_url(PZ_Config::CALLBACK_URL)
    @charging_api_url = PZ_Config::API_BASE
    set_buyer_email_address(params[:buyer_email_address])
    set_buyer_phone_no(params[:buyer_phone_no])
    set_buyer_unique_id(params[:buyer_unique_id])
    set_shipping_address(params[:shipping_address])
    set_shipping_city(params[:shipping_city])
    set_shipping_state(params[:shipping_state])
    set_shipping_zip(params[:shipping_zip])
    set_shipping_country(params[:shipping_country])
    set_merchant_transaction_id(params[:merchant_transaction_id])
    set_billing_name(params[:billing_name])
    set_billing_city(params[:billing_city])
    set_billing_state(params[:billing_state])
    set_billing_zip(params[:billing_zip])
    set_billing_country(params[:billing_country])
    set_transaction_type(params[:transaction_type])
    set_transaction_amount(params[:transaction_amount])
    set_payment_method(params[:payment_method])
    set_emi_months(params[:emi_months])
    set_bank_name(params[:bank_name])
    set_currency(params[:currency])
    set_min_sla(params[:min_sla])
    set_is_user_logged_in(params[:is_user_logged_in])
    set_address_count(params[:address_count])
    set_sales_channel(params[:sales_channel])
    set_item_total(params[:item_total])
    set_item_vertical(params[:item_vertical])
    set_sms_notify_number(params[:sms_notify_number])
    set_source(params[:source])
    set_product_info1(params[:product_info1])
    set_product_info2(params[:product_info2])
    set_product_info3(params[:product_info3])
    set_hash_method(params[:hash_method])
    set_terminal_id(params[:terminal_id])
    set_udf1(params[:udf1])
    set_udf2(params[:udf2])
    set_udf3(params[:udf3])
    set_udf4(params[:udf4])
    set_udf5(params[:udf5])
    set_ui_mode(params[:ui_mode])
    @request_array = charge() #calculate hash, validate fields, assign URL, error_message.

    @params = params

  end

  def show
  end
end
