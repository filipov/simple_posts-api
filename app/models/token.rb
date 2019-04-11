# frozen_string_literal: true

# @author Andrey Filipov <andrey@filipov.ws>
# Class implements JWT token
#
# @attribute data [r]
#   @return [Hash] Payload data
#
# @attribute token [r]
#   @return [String] JWT Token
#
# @example
#   token = Token.new(value: { data: 'Hello!' })
#
#   token.data
#   # => { data: 'Hello!' }
#
#   token.token
#   # => "eyJhbGciOiJub25lIn0.eyJkYXRhIjoiSGVsbG8hIiwidHlwZSI6InRva2VuIn0."
#
#   token = Token.new(
#     value: 'eyJhbGciOiJub25lIn0.eyJkYXRhIjoiSGVsbG8hIiwidHlwZSI6InRva2VuIn0.'
#   )
#
#   token.data
#   # => { data: 'Hello!' }
#
#   token.token
#   # => eyJhbGciOiJub25lIn0.eyJkYXRhIjoiSGVsbG8hIiwidHlwZSI6InRva2VuIn0.
class Token
  attr_reader :data, :token

  # @!method initialize(value)
  #
  # Class constructor
  #
  # @param value [Hash, String] Data or JWT token
  #
  # @return [Token]
  def initialize(value)
    @payload = {}

    if value.class == String
      @current_time = 0
      @token = value

      decode
    else
      @current_time = Time.now.to_i
      @data = value

      encode
    end
  end

  # @!method payload
  #
  # Return data from tokens payload
  #
  # @return [Hash]
  def payload
    return @payload if @current_time.zero?

    payload = conf.payload.to_hash.deep_symbolize_keys

    @data
      .merge(type: self.class.name.underscore)
      .merge(payload.transform_values { |value| @current_time + value })
  end

  private

  # @!method conf
  #
  # Return tokens configuration by class name
  #
  # @private
  #
  # @return [Dry::Configurable::NestedConfig]
  def conf
    Config.send(self.class.name.underscore)
  end

  # @!method encode
  #
  # Encoding JWT token
  #
  # @private
  #
  # @return [hsh]
  def encode
    @token = JWT.encode(payload, secret_key, conf.algorithm)
  end

  # @!method decode
  #
  # Decoding JWT token
  #
  # @private
  #
  # @return [hsh]
  def decode
    @payload =
      JWT.decode(
        @token, secret_key, conf.verification, conf.settings
      )[0].deep_symbolize_keys

    create_data_from_payload
  end

  # @!method create_data
  #
  # Create data from payload
  #
  # @private
  #
  # @return [hsh]
  def create_data_from_payload
    @data = @payload.clone

    @data.delete :type

    conf
      .payload
      .to_hash
      .deep_symbolize_keys
      .keys.each { |key| @data.delete key }
  end

  # @!method secret_key
  #
  # Get secret key for token
  #
  # @return [String]
  def secret_key
    conf.secret
  end
end
