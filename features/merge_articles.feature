Feature: Merge Articles
  As a blog administrator
  In order to merge similar articles
  I want to be able to merge two articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist:
    | id | title     | body         |
    | 2  | Foobar    | LoremIpsum   |
    | 3  | Foobar 2  | LoremIpsum 2 |
    And the following comments exist:
    | id | article_id | title | body      | author |
    | 2  | 2          | bar   | comment   | admin  |
    | 3  | 3          | bar 2 | comment 2 | admin  |

  Scenario: Successfully merge articles
    Given I am on the article page for "Foobar"
    When I fill in "merge_with" with "3"
    And I press "Merge"
    Then the article "Foobar" should have body "LoremIpsumLoremIpsum 2"
    And the article "Foobar" should have comment "bar 2"
