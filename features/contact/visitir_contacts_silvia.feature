Feature: Visitor contacts Silvia
  As a visitor
  I want to contact Silvia
  So I can ask for her something

  Scenario: Visitor contacts Silvia using the contact form
    Given I am on contact page
    When I fill in the contact form and submit it
    Then I should see a message telling me that the contact request has been sent
    And Silvia should receive an email with the contact form information

  @navigation
  Scenario: Visitor reaches contact page
    Given I am on the homepage
    When I click contact link
    Then I should be at the contact page
