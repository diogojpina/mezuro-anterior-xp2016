Feature: Metric Configuration edition
  In order to interact with metric configurations
  As a regular user
  I should edit the informations of metric configurations

  @kalibro_restart
  Scenario: the configuration is not mine
    Given I am a regular user
    And I am signed in
    And I have a sample configuration
    And I have a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    When I am at the Sample Configuration page
    Then I should not see "Edit"

  @kalibro_restart
  Scenario: editing a metric configuration successfully
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I have a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    And I am at the Sample Configuration page
    When I click the Edit link
    And I fill the Code field with "Another_Code"
    And I press the Save button
    Then I should see "Another_Code"

  @kalibro_restart
  Scenario: trying to edit with an existing code
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I have a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    And I have another metric configuration with code "Another_Code" within the given mezuro configuration
    When I visit the sample metric configuration edit page
    And I fill the Code field with "Another_Code"
    And I press the Save button
    Then I should see "Code There's already"

  @kalibro_restart
  Scenario: trying to edit with blank fields
    Given I am a regular user
    And I am signed in
    And I own a sample configuration
    And I have a sample reading group
    And I have a sample metric configuration within the given mezuro configuration
    When I visit the sample metric configuration edit page
    And I fill the Code field with " "
    And I fill the Weight field with " "
    And I press the Save button
    Then I should see "Code can't be blank"
    And I should see "Weight can't be blank"