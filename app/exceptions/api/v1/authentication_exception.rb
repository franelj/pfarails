class Api::V1::AuthenticationException < StandardError
  attr_reader :message

  def initialize(message)
    @message = message
  end
end