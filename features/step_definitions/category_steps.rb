Given /^some categories exists$/ do
  @current_category = Category.make!
end

Given /^some active categories exist$/ do
  @categories = Category.make!(3, active: true)
end

Then /^I should see these categories at the main menu$/ do
  within '#sidebar nav' do
    @categories.each do |category|
      page.has_link?(category.name).must_equal true
    end
  end
end

Given /^some inactive categories exist$/ do
  @categories = Category.make!(3, active: false)
end

Then /^I should not see these categories$/ do
  within '#sidebar nav' do
    @categories.each do |category|
      page.has_link?(category.name).must_equal false
    end
  end
end

Given /^an active category exists$/ do
  @current_category = Category.make!(active: true)
end

Given /^some works exist for this category$/ do
  @works = Illustration.make!(2, category: @current_category)
end

When /^I click on the first category$/ do
  click_link @current_category.name
end

Then /^I should see the works for this category$/ do
  @works.each do |work|
    must_see_illustration(work)
  end
end
