$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'net/http'
require 'uri'
begin
  require 'nokogiri'
rescue LoadError
  require 'rubygems'
  require 'nokogiri'
end

#require 'smsinabox/exceptions'
#require 'smsinabox/message'
#require 'smsinabox/configuration'

module Smsinabox

  VERSION = '0.2.0'

  autoload :Exceptions,     'smsinabox/exceptions'
  autoload :Message,        'smsinabox/message'
  autoload :Configuration,  'smsinabox/configuration'
  autoload :DeliveryReport, 'smsinabox/delivery_report'
  autoload :SMS,            'smsinabox/sms'

  class << self

    # Username for the SMS in a Box service
    attr_accessor :username

    # Password for the SMS in a Box service
    attr_accessor :password

    def uri
      @uri ||= URI.parse('http://www.mymobileapi.com/api5/http5.aspx')
    end

    # Return the number of available credits
    def credit_remaining
      perform_request( 'Type' => 'credits' ) do |xml|
        xml.xpath('/api_result/data/credits/text()').to_s.to_i
      end
    end

    # Send a #Messages and returns a #DelieryReport
    def deliver( message )
      raise MessageInvalid unless message.valid?

      perform_request(
        'Type' => 'sendparam',
        'return_credits' => 'True',
        'return_msgs_success_count' => 'True',
        'return_msgs_failed_count' => 'True',
        'return_entries_success_status' => 'True',
        'return_entries_failed_status' => 'True',
        'numto' => message.recipient,
        'data1' => message.body
      ) do |response|
        DeliveryReport.from_response( response )
      end
    end

    # Set our username and password from #Smsinabox::Configuration
    def configure!( config_file = nil )
      c = Configuration.new( config_file )
      @username = c["username"]
      @password = c["password"]
      nil
    end

    private

    def perform_request( params = {}, &block )
      raise MissingCredentialException if @username.nil? || @password.nil?
      params.merge!( 'Username' => @username, 'Password' => @password )

      req = Net::HTTP::Post.new( uri.path )
      req.set_form_data( params )
      req['user-agent'] = 'SMS in a Box/' + Smsinabox::VERSION
      res = Net::HTTP.new( uri.host, uri.port ).start { |http| http.request( req ) }
      case res
      when Net::HTTPSuccess
        yield Nokogiri::XML( res.body )
      else
        raise "Could not complete request"
      end
    end

  end

end
