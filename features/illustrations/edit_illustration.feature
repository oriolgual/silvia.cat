Feature: Edit illustrations
  As an admin
  I want to edit an illustration
  So I can change its data and create thumbnails

  Background:
    Given I am logged in at the backend
    And an illustration exists

  Scenario: Edit an illustration
    Given I am on the illustration edit page
    When I fill in the illustration form to change some data
    Then I should see a confirmation message telling me that the illustration has been updated
    And I should see the changes
    And I should see a thumbnail of the illustration image
