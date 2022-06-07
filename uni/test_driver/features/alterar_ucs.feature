Feature: Alterar Unidades Curriculares

 # this tests expect that your login is saved
  Scenario: Abrir pagina de alteração das unidades curriculares
    Given I wait until the "main-page" is present
    When  I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "alteracao_ucs_pickup_button" button
    Then I wait until the "uc_cards" is present


  Scenario: Desinscrever turma atribuida à primeira unidade curricular
    Given I wait until the "main-page" is present
    When I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "alteracao_ucs_pickup_button" button
    And I tap the "desinscrever_1st_turma" button
    Then I expect the text "Turma: -" to be present within the "1st_uc"

  Scenario: Desinscrever a primeira unidade curricular
    Given I wait until the "main-page" is present
    When I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "alteracao_ucs_pickup_button" button
    And I tap the "desinscrever_1st_turma" button
    #Then I wait until the "desinscrever_1st_turma" is absent

