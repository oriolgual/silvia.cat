# encoding: utf-8

When /^I click the about link$/ do
  click_link 'qui sóc?'
end

Then /^I should see more information about Silvia$/ do
  page.has_content?('Silvia Puig Brujas').must_equal true
end
