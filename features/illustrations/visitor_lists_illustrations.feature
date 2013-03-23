Feature: Visitor views illustrations
  As a visitor
  I want to view Silvia's illustrations
  So I can check her work

  Background:
    Given some illustrations exists

  Scenario: Visitor views illustrations at the home page
    Given I am on the homepage
    Then I should see the illustrations

  Scenario: Visitor views categorized illustrations
    Given some illustration are categorized with fanart
    And I am on the homepage
    When I click on the fanart link
    Then I should only see fanart illustrations
