Feature: Visitor views illustrations
  As a visitor
  I want to view Silvia's illustrations
  So I can check her work

  Background:
    Given some illustrations exists

  Scenario: Visitor views illustrations at the home page
    Given I am on the homepage
    Then I should see the illustrations
    And I should see the expanded view of the newest illustration

  Scenario: Visitor view a bigger illustration clicking at a thumbnail
    Given I am on the homepage
    When I click on the first thumbnail
    Then I should see a bigger picture of the illustration
    And I should see the illustration data

  @javascript
  Scenario: Visitor view even a bigger illustration clicking at an illustration
    Given I have clicked on an illustration thumbnail
    When I click at the illustration bigger picture
    Then I should see a high-res illustration picture

  @javascript
  Scenario: Visitor views more illustrations using the pagination
    Given there are even more illustrations
    And I am on the homepage
    When I click the pagination link to view more illustrations
    Then I should see new illustrations

  Scenario: Visitor views categorized illustrations
    Given some illustration are categorized with fanart
    And I am on the homepage
    When I click on the fanart link
    Then I should only see fanart illustrations
