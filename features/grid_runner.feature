Feature: My bootstrapped app kinda works
  In order to get going on coding my awesome app
  I want to have aruba and cucumber setup
  So I don't have to do it myself

  Scenario: App just runs
    When I get help for "grid_runner"
    Then the exit status should be 0

Scenario: list
    When I call "list" for "grid_runner"
    Then the exit status should be 0
