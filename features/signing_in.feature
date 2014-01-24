Feature: Login_in
  Scenario: Unsuccessful login in
    Given a user visits the login page
    When they submit invalid login information
    Then they should see an error message