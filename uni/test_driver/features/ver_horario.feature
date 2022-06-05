Feature: Ver Horário


#  this tests expect that your login is saved
  Scenario: Ver horário
    When I wait until the "main-page" is present
    And  I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "ver_horario_pickup_button" button
    Then I wait until the "horario_page_pickup" is present


  Scenario: Ver horário e dar swipe
    When I wait until the "main-page" is present
    And I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "ver_horario_pickup_button" button
    And I swipe left by 300 pixels on the "horario_page_pickup_schedule"
    Then I wait until the "horario_page_pickup" is present




