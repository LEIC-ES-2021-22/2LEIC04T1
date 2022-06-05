Feature: Ver Horário Turma


#  this tests expect that your login is saved
  Scenario: Ver horário cadeira de Engenharia de Software
    When I wait until the "main-page" is present
    And  I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "ver_horario_turma_pickup_button" button
    And I tap the "esof_schedule_pickup_text" text
    Then I wait until the "horario_uc_page_pickup" is present


  Scenario: Ver horário cadeira de Engenharia de Software e mudar de dia fazendo swipe
    When I wait until the "main-page" is present
    And I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "ver_horario_turma_pickup_button" button
    And I tap the "esof_schedule_pickup_text" text
    And I swipe left by 300 pixels on the "schedule_tab"
    Then I wait until the "horario_uc_page_pickup" is present


  Scenario: Ver horário cadeira de Engenharia de Software e mudar de dia clicando na tab
    When I wait until the "main-page" is present
    And  I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "ver_horario_turma_pickup_button" button
    And I tap the "esof_schedule_pickup_text" text
    Then I wait until the "horario_uc_page_pickup" is present






