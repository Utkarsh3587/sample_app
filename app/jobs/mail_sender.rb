require 'sendgrid-ruby'
require 'logger'
LOGGER_MAIL = Logger.new('./log/mail_sender.log', 30, 10240000)
LOGGER_MAIL.level = Logger::DEBUG
class Mail_sender
  @queue = :send_mail
  def self.preprocess
    LOGGER_MAIL.debug { "Method #{__method__} started" }
    LOGGER_MAIL.info { 'Preprocessing mail sending parameters' }
    mail_obj = SendGrid::Mail.new do |mail|
      mail.to = ['soniutkarsh91@gmail.com']
      mail.from = 'utkarsh@ukarsh.com'
      mail.subject = 'subject'
      mail.html = 'hello there'
    end
    mail_obj
  end

  def self.perform
    client = SendGrid::Client.new(api_key: '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')
    mail_obj = preprocess
    response = client.send(mail_obj)
    LOGGER_MAIL.info { "Response code is #{response.code}"}
  end
end