Feature: Get a random quote

    I want to receive a random quote when I visit the website page


    Scenario: I load the page
        Given I click on a link to visit the page
        When the page loads
        Then I should see a random quote appear on the screen

    Scenario: I want a new quote on the page
        Given I am already on the page
        When I click on a button
        Then I should see a new random quote appear on the screen
