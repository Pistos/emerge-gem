Feature: Emerge gems
  In order to avoid waiting for downstream package maintainers
  As a Gentoo user
  I want to be able to emerge gems

  Scenario: Emerge a single gem
    Given I want to install rack
    When I run emerge-gem rack
    Then rack should be installed into Portage
      And the rack gem should be installed

  Scenario: Emerge a gem with dependencies
    Given I want to install ramaze
    When I run emerge-gem ramaze
    Then rack should be installed into Portage
      And the rack gem should be installed
      And ramaze should be installed into Portage
      And the ramaze gem should be installed

  Scenario: Emerge an already-gem-installed gem
    Given I want to install rack
      And the rack gem is already installed
      And rack is not installed into Portage
    When I run emerge-gem ramaze
    Then emerge-gem should detect that rack is installed outside of Portage
      And emerge-gem should prompt to uninstall the rack gem
      And the rack gem should be installed
