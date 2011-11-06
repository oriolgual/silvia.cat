require 'mail'

def unread_emails_for(address)
  mailbox_for(address)
end

def mailbox_for(address)
  ActionMailer::Base.deliveries.select { |email|
    (email.to && email.to.include?(address)) ||
      (email.bcc && email.bcc.include?(address)) ||
      (email.cc && email.cc.include?(address)) }
end

def open_email(address, opts={})
  @current_email = if opts[:with_subject]
    expected_subject = (opts[:with_subject].is_a?(String) ? Regexp.escape(opts[:with_subject]) : opts[:with_subject])
    mailbox_for(address).find { |m| m.subject =~ Regexp.new(expected_subject) }
  elsif opts[:with_text]
    expected_text = (opts[:with_text].is_a?(String) ? Regexp.escape(opts[:with_text]) : opts[:with_text])
    mailbox_for(address).find { |m| m.default_part_body =~ Regexp.new(expected_text) }
  else
    mailbox_for(address).first
  end
  raise "Could not find email for #{address}" unless @current_email
  @current_email
end

def parse_email_for_link(email, text_or_regex)
  url = parse_email_for_explicit_link(email, text_or_regex)
  url ||= parse_email_for_anchor_text_link(email, text_or_regex)

  raise "No link found matching #{text_or_regex.inspect} in #{email}" unless url
  url
end

def request_uri(link)
  return unless link
  url = URI::parse(link)
  url.fragment ? (url.request_uri + "#" + url.fragment) : url.request_uri
end

# e.g. confirm in http://confirm
def parse_email_for_explicit_link(email, regex)
  regex = /#{Regexp.escape(regex)}/ unless regex.is_a?(Regexp)
  url = links_in_email(email).detect { |link| link =~ regex }
  request_uri(url)
end

# e.g. Click here in  <a href="http://confirm">Click here</a>
def parse_email_for_anchor_text_link(email, link_text)
  if textify_images(email.default_part_body) =~ %r{<a[^>]*href=['"]?([^'"]*)['"]?[^>]*?>[^<]*?#{link_text}[^<]*?</a>}
    URI.split($1)[5..-1].compact!.join("?").gsub("&amp;", "&")
    # sub correct ampersand after rails switches it (http://dev.rubyonrails.org/ticket/4002)
  else
    return nil
  end
end

def textify_images(email_body)
  email_body.to_s.gsub(%r{<img[^>]*alt=['"]?([^'"]*)['"]?[^>]*?/>}) { $1 }
end

def links_in_email(email)
  URI.extract(email.default_part.body.to_s, ['http', 'https'])
end

module MailExt
  def default_part
    @default_part ||= html_part || text_part || self
  end

  def default_part_body
    default_part.body
  end
end
def visit_in_email(link_text, address = nil, opts = {})
  if !@current_email && address
    open_email(address, opts)
  end
  visit(parse_email_for_link(@current_email, link_text))
end

Mail::Message.send(:include, MailExt)
