# encoding: utf-8

Given /^I am add the illustrations create page$/ do
  authorize('frodo', 'thering')
  visit new_backend_illustration_path
end

When /^I fill the illustration form with all the necessary data$/ do
  fill_in 'Nom (català)', with: 'Course of witches'
  fill_in 'Nom (castellà)', with: 'Course of witches castellà'
  fill_in 'Descripció (català)', with: 'Personatge per un còmic'
  fill_in 'Descripció (castellà)', with: 'Personatge per un còmic'
  attach_file 'Imatge', Rails.root.join('spec/support/files/illustration.jpg')
  select(@current_category.name, from: 'Categoria')
  click_button 'Crear Il·lustració'
end

Then /^I should see a confirmation message telling me that the illustration has been created$/ do
  must_have_confirmation_message('Il·lustració creada correctament')
end

Then /^I should be on the edit illustration page so I can create a thumbnailer later$/ do
  must_be_on edit_backend_illustration_path(Illustration.last)
end

Given /^an illustration exists$/ do
  @current_illustration = Illustration.make!
end

Given /^I am on the illustration edit page$/ do
  visit edit_backend_illustration_path(@current_illustration)
end

When /^I fill in the illustration form to change some data$/ do
  fill_in 'Nom', with: 'Sketch #1'
  find('input#illustration_thumbnail_coordinates').set('{"x":0,"y":0,"w":10,"h":10}')
  click_button 'Actualitzar Il·lustració'
end

Then /^I should see a confirmation message telling me that the illustration has been updated$/ do
  must_have_confirmation_message('Il·lustració actualitzada correctament')
end

Then /^I should see the changes$/ do
  page.has_content?('Sketch #1').must_equal true
end

Then /^I should see a thumbnail of the illustration image$/ do
  page.has_css?('img#thumb').must_equal true
end
