Feature: Ver Horário Turma


#  this tests expect that your login is saved
  Scenario: Ver horário cadeira de Engenharia de Software
    When  I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "ver_horario_pickup_button" button
    And I tap the "esof_schedule_pickup_text" text
    Then I wait until the "horario_page_pickup" is present






