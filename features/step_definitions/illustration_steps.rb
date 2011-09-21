# encoding: utf-8

Given /^I am add the illustrations create page$/ do
  authorize('frodo', 'thering')
  visit new_backend_illustration_path
end

When /^I fill the illustration form with all the necessary data$/ do
  fill_in 'Nom', with: 'Course fo witches'
  fill_in 'Descripció', with: 'Personatge per un còmic'
  attach_file 'Imatge', Rails.root.join('spec/support/files/illustration.jpg')
  select(@current_tag.name, from: 'Tags')
  click_button 'Crear Il·lustració'
end

Then /^I should see a confirmation message telling me that the illustration has been created$/ do
  must_have_confirmation_message('Il·lustració creada correctament')
end

Then /^I should be on the edit illustration page so I can create a thumbnailer later$/ do
  must_be_on edit_backend_illustration_path(Illustration.last)
end
