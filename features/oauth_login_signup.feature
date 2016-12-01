Feature:
  As a user, I want to be able to login or signup
  Using either Facebook or Google+
  So that I may create an account or login quicker

Background:
  Given I am on the home page
  When I follow "Login"

@omniauth_facebook_test_success
  Scenario: A user successfully signs in with Facebook
    Given I am on the homepage
    And I follow "Login"
    When I follow "Sign in with Facebook"
    Then I should see "Login successful."

@omniauth_test_failure
  Scenario: A user unsuccessfully signs in with Facebook
    Given I am on the homepage
    And I follow "Login"
    When I follow "Sign in with Facebook"
    Then I should see "Failed."



@omniauth_test_failure
  Scenario: A user unsuccessfully signs in with Google
    Given I am on the homepage
    And I follow "Login"
    When I follow "Sign in with Google"
    Then I should see "Failed."
