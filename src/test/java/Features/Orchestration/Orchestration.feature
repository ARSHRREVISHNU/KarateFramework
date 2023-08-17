Feature: Orchestration Feature

  Scenario: features 1
    #Given def fet1 = call read("One.feature")
    #Then print fet1.val1
    Given call read("One.feature")

  Scenario: features 2
    #Given def fet2 = call read("Two.feature")
    #Then print fet2.val5
    Given call read("Two.feature")

  Scenario: features 3
    #Given def fet3 = call read("Three.feature")
    #Then print fet3.val8
    Given call read("Three.feature")
