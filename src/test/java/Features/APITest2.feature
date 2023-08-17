Feature: API Test2 feature

  Background: Base url background
    Given  url 'https://reqres.in/'

  Scenario: GET Reqres
    Given path '/api/users'
    When method get
    Then status 200
    And def outputEmail = []
    And def outputFirstName = []
    And def outputLastName = []
    #And response.data.filter(x => x.email.endsWith(".in")); outputEmail.push(x.email), outputFirstName.push(x.first_name), outputLastName.push(x.last_name)
    * def myFun =
      """
      function(arg){
      for(i=0; i<arg.length; i++) {
      if(arg[i].email.endsWith(".in"))
      {
      outputEmail.push(arg[i].email), outputFirstName.push(arg[i].first_name), outputLastName.push(arg[i].last_name)
      }
      }
      }
      """
    Then call myFun response.data
    And print outputEmail
    And print outputFirstName
    And print outputLastName
    #Using wildcard get email from all the json objects. Both should be equal also the order should be same
    Then match response.data[*].email == [ 'george.bluth@reqres.in', 'janet.weaver@reqres.in', 'emma.wong@reqres.in', 'eve.holt@reqres.in', 'charles.morris@reqres.in', 'tracey.ramos@reqres.in' ]
    # used wildcard(*) with contains where it checks "George", "Janet" was present or not
    Then match response.data[*].first_name contains [ "George", "Janet" ]

  Scenario: GET Reqres
    Given path '/api/users'
    When method get
    Then status 200


  Scenario: Writing single line function
    * def myFun = function(){ return 'its from fun' }
    * def dataValue = call myFun
    Then print 'function retured value', dataValue

