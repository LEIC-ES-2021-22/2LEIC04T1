Feature: Alterar Unidades Curriculares

 # this tests expect that your login is saved
  Scenario: Abrir pagina de alteração das unidades curriculares
    When I wait until the "main-page" is present
    And  I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "alteracao_ucs_pickup_button" button


  Scenario: Desinscrever turma atribuida à unidade curricular
    When I wait until the "main-page" is present
    And I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "alteracao_ucs_pickup_button" button
    And I tap the "desinscrever_turma" button

