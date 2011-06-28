# encoding: utf-8

def current_path
  URI.parse(current_url).path
end

def check_email_with_subject(options)
  unread_emails_for(options[:email]).select { |m| m.subject =~ Regexp.new(options[:subject]) }.size.must_equal(options[:count] || 1)
end

def must_have_confirmation_message(message = nil)
  must_have_message('notice', message)
end

def must_have_error_message(message = nil)
  must_have_message('alert', message)
end

def must_have_message(type, message = nil)
  if message
    within("div#flash-#{type}") do
      page.has_content?(message).must_equal true
    end
  else
    page.has_css?("div#flash-#{type}").must_equal true
  end
end
