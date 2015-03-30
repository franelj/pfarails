class Api::V1::BadArgumentsException < StandardError
  attr_reader :message

  def initialize(*keys)
    @message = "Bad arguments."
    @message += " Following keys are missing : " + keys.join(", ") if keys.size > 0
  end
end