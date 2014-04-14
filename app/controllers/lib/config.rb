module PZ_Config

  MERCHANT_ID = "" # Your Merchant ID
  SECRET_KEY = "" # Your Secret Key. Do not share this.
  TRANSACTION_TYPE = "SALE"
  CURRENCY = "INR"
  UI_MODE = "REDIRECT" # UI Integration - REDIRECT or IFRAME
  HASH_METHOD = "SHA256" # MD5 or SHA256
  MERCHANT_KEY_ID = "" # Your Merchant Key ID
  CALLBACK_URL = "http://localhost:3000/response/response_display" # Your callback URL

  API_BASE = "https://www.payzippy.com/payment/api/"
  API_CHARGING = "charging"
  API_QUERY = "query"
  API_REFUND = "refund"
  API_VERSION = "v1"
  VERIFY_SSL_CERTS = true

end
