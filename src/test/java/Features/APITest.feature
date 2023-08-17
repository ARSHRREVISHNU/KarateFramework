Feature: API Testing

  @ReqresGET
  Scenario: GET Response Check
    Given url 'https://reqres.in/api/users'
    When method get
    Then status 200
    And match response.data[0].email == '#string'
    And match response.data[0].email contains 'george.bluth@reqres.in'
    #And match response.page !contains '7'
    And match each response.data ==
    """
    {
      "id": "#number",
      "email": "#string",
      "first_name":"#string",
      "last_name":"#string",
      "avatar":"##string"
    }
    """


  Scenario Outline: GET Response with multiple inputs
    Given url '<url>'
    When method get
    Then status 200
    And match response.data[0].email == '#string'
    And match response.data[0].email contains 'george.bluth@reqres.in'
    And def email = response.data[0].email
    And print email
    And print '<emailTo>'
    Examples:
    |url|emailTo|
    |https://reqres.in/api/users|email1|
    |https://reqres.in/api/users|email2|
    |https://reqres.in/api/users|email3|

  Scenario: POST Data
    Given url 'https://jsonplaceholder.typicode.com/posts'
    And header Content-type = 'application/json;charset=UTF-8'
    And request {"title" : "Vishnu","body":"Sample body","userId":101}
    When method post
    Then status 201

  Scenario: GET Dummy API Data
    Given url 'https://dummyapi.io/data/v1/post'
    And header app-id = '64dba064e756e1f3ec5e9f54'
    When method get
    Then status 200
    And def res = response
    And print res