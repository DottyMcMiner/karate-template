Feature: Video Game Database Tests

Background:
    * def Fixture = Java.type('examples.Fixture')
    * def fix = new Fixture()
    * url fix.URL_VIDEOGAME_DB

Scenario: Get All Video Games
    Given path 'videogame'
    When method GET
    Then status 200
    And print response

    * def firstGame = response[0]

    Given path 'videogame', firstGame.id
    When method GET
    Then status 200

Scenario: Create a new game
    * def videoGame = 
    """
    {
        "category": "Platform",
        "name": "Mario",
        "rating": "Mature",
        "releaseDate": "2012-05-04",
        "reviewScore": 85,
    }
    """
    Given path 'videogame'
    And request videoGame
    When method POST
    Then status 200