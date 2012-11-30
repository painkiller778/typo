Feature: Create category
  As a blog administrator
  In order to organize articles
  I want to be able to create categories
 
  Background:
    Given the blog is set up
    Given I am logged into the admin panel

  Scenario: Thing is working
    Given I am on the categories page
    When I fill in "category[name]" with "Batatas"
    When I fill in "category[keywords]" with "batatas, potato"
    When I fill in "category[permalink]" with "batatas"
    When I fill in "category[description]" with "Lorem ipsum sit dolor amet"
    When I press "Save"
    Then I should see "Category was successfully saved"