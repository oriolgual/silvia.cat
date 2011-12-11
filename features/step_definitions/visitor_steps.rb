# encoding: utf-8
Given /^some illustrations exists$/ do
  @illustrations = Illustration.make!(8)
end

Given /^I am on the homepage$/ do
  visit root_path
end

Then /^I should see the illustrations$/ do
  page.has_css?('li.thumbnail', count: @illustrations.length).must_equal true
end

Then /^I should see the expanded view of the newest illustration$/ do
  # must_see_illustration_data @illustrations.last
end

When /^I click on the first thumbnail$/ do
  @current_illustration = @illustrations.first
  click_link @current_illustration.name
end

Then /^I should see a bigger picture of the illustration$/ do
  page.has_xpath?("//img[@alt='#{@current_illustration.name}']").must_equal true
end

Then /^I should see the illustration data$/ do
  must_see_illustration_data @current_illustration
end

Given /^I have clicked on an illustration thumbnail$/ do
  @current_illustration = @illustrations.first
  visit illustration_path(@current_illustration)
end

When /^I click at the illustration bigger picture$/ do
  within '#work' do
    click_link @current_illustration.name
  end
end

Then /^I should see a high\-res illustration picture$/ do
  page.has_css?('img#fancybox-img').must_equal true
end

Given /^there are even more illustrations$/ do
  @illustrations = @illustrations + Illustration.make!(5)
end

When /^I click the pagination link to view more illustrations$/ do
  click_link 'Següent'
end

Then /^I should see new illustrations$/ do
  must_see_illustration(@illustrations.last)
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
