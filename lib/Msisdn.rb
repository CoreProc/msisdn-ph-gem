require "Msisdn/version"
require 'yaml'

module MsisdnPH
  class Msisdn

    def initialize(msisdn)

	  if Msisdn.validate(msisdn) == false
	    raise "The supplied MSISDN is not valid 
	  		   You can use the `Msisdn.validate()` method to validate 
	  		   the MSISDN being passed."
	  	end
	  	@msisdn = Msisdn.clean(msisdn)
	  		
	end

	def get(countryCode = false, separator = '')

	  if countryCode?
	    formattedNumber = '0' + @msisdn
		  unless separator.empty?
	  	    formattedNumber.insert(4, separator) 
	  		formattedNumber.insert(8, separator)
	  	  end
	  else
	    formattedNumber = '+63' + @msisdn
		  unless separator.empty?
	  	    formattedNumber.insert(3, separator)
	  		formattedNumber.insert(7, separator)
	  		formattedNumber.insert(11, separator)
	  	  end
	  end

	  return formattedNumber
  	end

	def prefix
	  if @prefix.nil?
	    @prefix = @msisdn[0..2]
  	  end

	  return @prefix
  	end

  	def operator
	  set_prefix

 	    if @globePrefixes.values[0].include?(prefix) 
		  @operator = "GLOBE"
  		elsif @sunPrefixes.values[0].include?(prefix)
  		  @operator = "SUN"
  		elsif @smartPrefixes.values[0].include?(prefix)
	  	  @operator = "SMART"
  		else
  		  @operator = "UNKNOWN"
  		end
  	end


  	def self.validate(mobile_number)
	  mobile_number = self.clean(mobile_number)
	    
	    return !mobile_number.empty? && 
	    		mobile_number.length === 10
  	end

  	def self.clean(msisdn)

	  msisdn = msisdn.gsub(/[^0-9]/, "")
	  
 	    if msisdn[0..0] == '0'
  		  msisdn = msisdn[1..msisdn.length]
  		elsif msisdn[0..1] == '63'
		  msisdn = msisdn[2..msisdn.length]
  		end

  	end

  	private
  	  def set_prefix 
	  		
	    if @globePrefixes.nil?
			@globePrefixes = YAML.load_file(File.join(File.dirname(__FILE__), "Msisdn", "data", "globe.yml"))
		end

		if @smartPrefixes.nil?
			@smartPrefixes = YAML.load_file(File.join(File.dirname(__FILE__), "Msisdn", "data", "smart.yml"))
		end

		if @sunPrefixes.nil?
			@sunPrefixes = YAML.load_file(File.join(File.dirname(__FILE__), "Msisdn", "data", "sun.yml"))
		end

  	  end

	end
end