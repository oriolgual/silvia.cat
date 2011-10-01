Feature: Visitor view about information
  As a visitor
  I want to view Silvia's about information
  So I can know more about her

  Scenario: Visitor views about information
    Given I am on the homepage
    When I click the about link
    Then I should see more information about Silvia
