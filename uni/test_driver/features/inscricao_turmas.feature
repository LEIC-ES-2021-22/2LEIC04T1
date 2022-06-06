Feature: Inscrição na turmas

 # this tests expect that your login is saved
  Scenario: Visualizar o numero de Vagas em cada turma na cadeira de Engenharia de Software
    When I wait until the "main-page" is present
    And  I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "inscricao_turmas_pickup_button" button


  Scenario: Fazer a inscrição na turma 2LEIC01 da cadeira de Engenharia de Software
    When I wait until the "main-page" is present
    And I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "inscricao_turmas_pickup_button" button

