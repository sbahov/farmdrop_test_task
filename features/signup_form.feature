Feature: Sign Up

  Background:
    Given I am on sign-up page

  Scenario: Successful account creation
    When I enter valid sign-up data
    And I click the submit button
    Then I see Account text in top header

  Scenario Outline: Invalid Input. Error message validation
    When I fill email field with <email>
    And I fill password field with <password>
    And I fill zipcode field with <zipcode>
    And I click the submit button
    Then I should see "<error>" message
  Examples:
    | email                     | password  | zipcode   | error                                           |
    | negative@test1.com        | password  |           | Zipcode can't be blank                          |
    | negative@test2.com        |           | WC2N 5DU  | Password can't be blank                         |
    |                           | password  | WC2N 5DU  | Email can't be blank                            |
    | registered@registered.com | password  | WC2N 5DU  | Email has already been taken                    |
    | negative@test3            |           | WC2N 5DU  | Email is invalid                                |
    | negative@test4.com        | short     | WC2N 5DU  | Password is too short (minimum is 6 characters) |


#  Scenario Outline: Tooltip verifications
#    When ...
#
#  Scenario: Signup With Facebook
#    When ...
