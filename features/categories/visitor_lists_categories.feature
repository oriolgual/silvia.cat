Feature: Visitor lists categories
  As a visitor
  I want to list categories
  So I can view Silvia's work

  Scenario: Visitor lists active categories
    Given some active categories exist
    When I am on the homepage
    Then I should see these categories at the main menu

  Scenario: Visitor does not view inactive categories
    Given some inactive categories exist
    When I am on the homepage
    Then I should not see these categories

  Scenario: Visitor views categorized work
    Given an active category exists
    And some works exist for this category
    When I am on the homepage
    And I click on the first category
    Then I should see the works for this category
