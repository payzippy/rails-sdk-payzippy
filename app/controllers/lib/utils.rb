require 'lib/constants.rb'
require 'lib/config.rb'
module PZ_Utils
  include PZ_Constants
  include PZ_Config

  def flatten_array (data, reentered)

    hash_params = Hash.new { |hash, key| hash[key] = Array.new }
    hash_params = data

    if !hash_params.any?
      return "|"
    end
    if !reentered
      @str1 = ""
    end
    sorted_params = Hash[hash_params.sort]
    sorted_params.each do |key, val|
      if key == 'hash' or key == 'controller' or key == 'action'
        next
      elsif val.is_a?(Hash)
        flatten_array(val, true)
      elsif val.is_a?(Array)
        @reentered = true
        sorted_params["data"].each do |num|
          flatten_array(num, true)
        end
      else
        @str1 = @str1 << val.to_s << "|"
      end
    end
    return @str1
  end

  def generate_hash(param)
    str = flatten_array(param, false)
    str << PZ_Config::SECRET_KEY
    return @hash_value2 = Digest::SHA256.hexdigest(str)
  end

  def is_valid_parameter value, max_length = 0
    if value == ""
      return false
    elsif max_length > 0 && value.length > max_length
      return false
    else
      return true
    end
  end

end
