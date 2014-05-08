payzippy-rails-sdk
==================

This is PayZippy's SDK for Ruby on Rails

### Installing Rails on Mac
http://www.rackspace.com/blog/installing-rails-on-a-mac/

### Installation

1. Download and unzip to get rails-sdk-payzippy folder.
2. Put it in your gems folder.
3. Go inside the folder and run "bundle install" to install missing gems.
4. Enter rails s in your terminal and goto `localhost:3000/` and from there to Charging, Query and refund API can also be accessed.

Sample code snippet to create a charging request object are shown below:

```
//In the check out page, create a form which will contain all the user input parameters and mention the controller value and action value

<form method="post" controller="charging" action="charging_display">
  <input id="buyer_email_address" name="buyer_email_address" type="text" value="user@domain.com" class="input-xlarge" required="">
  <input id="buyer_phone_no" name="buyer_phone_no" type="text" value="9999999999" class="input-xlarge">
  //similarly add the other parameters - make sure all the mandatory parameters are added
</form>

//then in the file charging_controller.rb, define the action charging_display
//import the dependent files config.rb and charging_request.rb
require 'lib/config.rb'
require 'lib/charging/charging_request.rb'

class ChargingController < ApplicationController
include PZ_Config
include ChargingRequest

def charging_display
//read and set the configurations in the charging request object
  set_merchant_id(PZ_Config::MERCHANT_ID)
  set_merchant_key_id(PZ_Config::MERCHANT_KEY_ID)
  set_callback_url(PZ_Config::CALLBACK_URL)
  @charging_api_url = PZ_Config::API_BASE
//set all the request parameters in the charging request object
  set_buyer_email_address(params[:buyer_email_address])
  set_buyer_phone_no(params[:buyer_phone_no])
  set_buyer_unique_id(params[:buyer_unique_id])
  set_shipping_address(params[:shipping_address])
  set_shipping_city(params[:shipping_city])
  set_shipping_state(params[:shipping_state])
  set_shipping_zip(params[:shipping_zip])

//finally call the charge method which return an array
@request_array = charge() #calculate hash, validate fields, assign URL, error_message.
@params = params
//In the display page charging_display.html.erb, based on the ui_mode value e can either display IFRAME or redirect the request
<%if @request_array["error_message"] == "" %>
  //if ui_mode is IFRAME
  <% if @param["ui_mode"] == "IFRAME" %>
    <iframe id="ifr" src="<%= @request_array["url"] %>"></iframe>
  //else if display mode is REDIRECT
  <% elsif @param["ui_mode"] == "REDIRECT" %>
    <form method="post" action="<%= @request_array["url"] %>" id="charging_request_form">
      <% @param.each do |key, val| %>
      <input type="hidden" name="<%= key %>" value="<%= val %>"/>
      <% end %>
    </form>
  //call the script to submit if ui_mode is REDIRECT
  <script>
    document.getElementById("charging_request_form").submit();
  </script>
  <% end %>
<% else %>
  Error Message: <%= @request_array["error_message"] %>
<% end %>
```

For complete code sample for the integration you can refer the example and the SDK
