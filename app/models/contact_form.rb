class ContactForm < MailForm::Base
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   validate: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: 'Contact form from silvia.cat',
      to: 'silvia@silvia.cat',
      from: %("#{name}" <#{email}>)
    }
  end
end
