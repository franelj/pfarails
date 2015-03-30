# config Houston

if Rails.env.production?
  APN = Houston::Client.production
else
  APN = Houston::Client.development
end

APN.certificate = File.read(File.join(Rails.root, "config/developmentApnsKey.pem"))
APN.gateway_uri = "apn://gateway.sandbox.push.apple.com:2195"
APN.feedback_uri = "apn://feedback.sandbox.push.apple.com:2196"
