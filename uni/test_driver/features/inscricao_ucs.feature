Feature: Inscrição nas Unidades Curriculares

 # this tests expect that your login is saved
  Scenario: Abrir página de inscrição de turmas
    When I wait until the "main-page" is present
    And  I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "inscricao_ucs_pickup_button" button


  Scenario: Abrir página com as unidades curriculares disponíveis para realizar a inscrição
    When I wait until the "main-page" is present
    And I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "inscricao_ucs_pickup_button" button
    And I tap the "add_ucs" button

  Scenario: Escolher uma UC
    When I wait until the "main-page" is present
    And I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "inscricao_ucs_pickup_button" button
    And I tap the "add_ucs" button
    And I tap the "adicionar_uc" button

