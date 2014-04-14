require 'lib/query/queryrequest.rb'
class QueryController < ApplicationController
  include QueryRequest

  def index


    # Set all the parameters that you want to send in the request.
    # You can also overwrite the default parameters set in the Config.php file.
    set_merchant_transaction_id(params[:merchant_transaction_id])
    set_payzippy_transaction_id(params[:payzippy_transaction_id])
    set_transaction_type(params[:transaction_type])
    set_merchant_key_id(params[:merchant_key_id])
    set_hash_method(params[:hash_method])

    # Finally, call the query function. It returns an instance of QueryResponse.
    @pz_query_response = query()

    # Call the validate function, to check the integrity of the response
    # by verifying the hash returned
    @is_hash_match = validate_response_hash()

    @status_code = get_status_code()
    @status_message = get_status_message()
    @error_code = get_error_code()
    @error_message = get_error_message()
    @merchant_id = get_merchant_id()
    @merchant_key_id = get_merchant_key_id()
    @hash_method = get_hash_method()
    @hash = get_hash()
  end
end
