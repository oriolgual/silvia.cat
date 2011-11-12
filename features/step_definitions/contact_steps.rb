#encoding: utf-8

Given /^I am on contact page$/ do
  visit new_contact_path
end

When /^I fill in the contact form and submit it$/ do
  fill_in 'Nom', with: 'Mr. Boogedy'
  fill_in 'Correu electrònic', with: 'mr@boogedy.com'
  fill_in 'Missatge', with: 'I need to clean my public image, would you make a cute design for me?'
  click_button 'Enviar'
end

Then /^I should see a message telling me that the contact request has been sent$/ do
  must_have_confirmation_message('Thank you for contacting me! You will be receiving an answer soon')
end

Then /^Silvia should receive an email with the contact form information$/ do
  check_email_with_subject(email: 'silvia@silvia.cat', subject: 'Contact form from silvia.cat')
end

When /^I click contact link$/ do
  click_link 'contacte'
end

Then /^I should be at the contact page$/ do
  must_be_on(new_contact_path)
end
