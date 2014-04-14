require 'lib/utils.rb'

module RefundTransactionResponse
  include PZ_Utils

  def refund_transaction_response(response)
    @refund_transaction_params = Hash.new { |hash, key| hash[key] = Array.new }
    @refund_transaction_params = response
  end

  def get_merchant_transaction_id()
    return @refund_transaction_params["merchant_transaction_id"]
  end

  def get_payzippy_transaction_id()
    return @refund_transaction_params["payzippy_transaction_id"]
  end

  def get_refund_amount()
    return @refund_transaction_params["refund_amount"]
  end

  def get_refund_status()
    return @refund_transaction_params["refund_status"]
  end

  def get_refund_response_code()
    return @refund_transaction_params["refund_response_code"]
  end

  def get_refund_response_message()
    return @refund_transaction_params["refund_response_message"]
  end

  def get_bank_arn()
    return @refund_transaction_params["bank_arn"]
  end

  def get_transaction_time()
    return @refund_transaction_params["transaction_time"]
  end

  def get_currency()
    return @refund_transaction_params["refund_currency"]
  end

  def get_udf1()
    return @refund_transaction_params["udf1"]
  end

  def get_udf2()
    return @refund_transaction_params["udf2"]
  end

  def get_udf3()
    return @refund_transaction_params["udf3"]
  end

  def get_udf4()
    return @refund_transaction_params["udf4"]
  end

  def get_udf5()
    return @refund_transaction_params["udf5"]
  end

  def get_response_params()
    return @refund_transaction_params
  end
end
