Feature: Add illustrations
  As an admin
  I want to add illustration to the application
  So I can expose my work

  Background:
    Given I am logged in at the backend
    And some categories exists

  Scenario: Add a new illustration
    Given I am add the illustrations create page
    When I fill the illustration form with all the necessary data
    Then I should see a confirmation message telling me that the illustration has been created
    And I should be on the edit illustration page so I can create a thumbnailer later
