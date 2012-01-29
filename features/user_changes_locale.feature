#encoding: utf-8

Feature: Change locale
  As a user
  I want to change the locale
  So I can read the content in my preferred language

  Scenario: User changes the locale to Spanish
    Given I am on the homepage
    When I follow Español in the language menu
    Then I should see the page in Spanish

  Scenario: User switches back to Catalan
    Given I am on the homepage
    And I am seeing the web in spanish
    When I follow Català in the language menu
    Then I should see the page in Catalan
