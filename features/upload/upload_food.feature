Feature: "Uploading a CSV file" do
  
  As a nutritionalist/food scientist
  So that I can contribute food information in bulk
  I want to upload a CSV file with info that will be saved into the database

Background: foods have been added to database

  Given the following foods exist:
  |name     | UPC |ingredients    |nutr_score|econ_score|gastro_score|nutr_advice|econ_advice|gastro_advice|
  |exists   | 1   |magic          |1        | 1         |1          |1          |1          |1            |
  
  Scenario: Upload successfully
    When I am on the upload page
    And I upload file "test.csv"
    Then I should see "CSV successfully uploaded"
    And the following food by UPC should exist: "2"
    And the following food by UPC should exist: "3"

  Scenario: Upload unsuccessfully
    When I am on the upload page
    And I upload file "testbad.csv"
    Then I should see "CSV not in right format"
