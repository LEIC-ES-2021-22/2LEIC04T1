Feature: Inscrição na turmas

 # this tests expect that your login is saved
  Scenario: Visualizar página para incrição em turmas
    Given I wait until the "main-page" is present
    When  I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "inscricao_turmas_pickup_button" button
    Then I wait until the "uc_cards" is present

  #this needs that the first uc has turma 2LEIC02
  Scenario: Fazer a inscrição na turma 2LEIC02 da primeira cadeira
    Given I wait until the "main-page" is present
    When I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "inscricao_turmas_pickup_button" button
    And I tap the "escolher_turma_1st_uc" button
    And I tap the "2LEIC02" element
    And I tap the "inscrever_turma_1st_uc" button
    Then I wait until the "1st_uc_is_2LEIC02" is present