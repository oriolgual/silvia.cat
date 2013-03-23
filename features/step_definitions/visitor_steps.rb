# encoding: utf-8
Given /^some illustrations exists$/ do
  @illustrations = Illustration.make!(8)
end

Given /^I am on the homepage$/ do
  visit root_path
end

Then /^I should see the illustrations$/ do
  page.has_css?('#works article', count: @illustrations.length).must_equal true
end

Given /^some illustration are categorized with fanart$/ do
  @fanart_illustration = Illustration.make!(category: Category.make(name: 'Fanart'))
end

When /^I click on the fanart link$/ do
  click_link 'Fanart'
end

Then /^I should only see fanart illustrations$/ do
  must_see_illustration(@fanart_illustration)
  @illustrations.each do |illustration|
    wont_see_illustration(illustration)
  end
end

def must_see_illustration_data(illustration)
  within '#work' do
    page.has_content?(illustration.name).must_equal true
    page.has_content?(illustration.description).must_equal true
  end
end

def must_see_illustration(illustration)
  page.has_xpath?("//img[@alt='#{illustration.name}']").must_equal true
end

def wont_see_illustration(illustration)
  page.has_xpath?("//img[@alt='#{illustration.name}']").must_equal false
end
