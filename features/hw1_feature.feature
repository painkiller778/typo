Feature: Merge articles
  As a blog administrator
  In order to merge articles with related content
  I want to be able to merge articles
 
  Background:
    Given the blog is set up
    Given the following articles exist:
    | title        | body                                           |
    | Article 1    | Lorem ipsum sit dolor amet                     |
    | Article 2    | Batatinha quando nasce, se esparrama pelo chao |
    Given the following comments exist:
    | author  | title        | body           | article     |
    | Autor 1 | Comentario 1 | Interessante!  | Article 1   |
    | Autor 2 | Comentario 2 | Maneiro        | Article 2   |
    | Autor 3 | Comentario 3 | Legal          | Article 2   |


  Scenario: Only admins can see a "Merge With This Article" button
    Given I am not am "admin"
    I should not see "Merge"

  Scenario: Successfully merge articles
    Given I am logged into the admin panel
    And I am on the article edit page for "Article 1"
    When I fill article_id with "Article 2" id
    And I submit the merge form
    Then "Article 1" body should contain "Lorem ipsum sit dolor amet" 
    And "Article 1" body should contain "Batatinha quando nasce, se esparrama pelo chao"
    And "Article 1" should have 3 comments
    And "Article 2" should not exist