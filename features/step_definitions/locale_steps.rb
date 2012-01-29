#encoding: utf-8

When /^I follow Español in the language menu$/ do
  within '#language' do
    click_link 'Español'
  end
end

Then /^I should see the page in Spanish$/ do
  page.has_content?('¿quién soy?').must_equal true
  page.has_content?('contacto').must_equal true
end

Given /^I am seeing the web in spanish$/ do
  within '#language' do
    click_link 'Español'
  end
end

When /^I follow Català in the language menu$/ do
  within '#language' do
    click_link 'Català'
  end
end

Then /^I should see the page in Catalan$/ do
  page.has_content?('qui sóc?').must_equal true
  page.has_content?('contacte').must_equal true
end
