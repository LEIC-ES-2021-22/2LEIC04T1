Feature: Inscrição nas Unidades Curriculares

 # this tests expect that your login is saved
  Scenario: Abrir página de inscrição nas Unidades Curriculares
    Given I wait until the "main-page" is present
    When  I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "inscricao_ucs_pickup_button" button
    Then I wait until the "uc_cards" is present


  Scenario: Abrir página com as unidades curriculares disponíveis para realizar a inscrição
    Given I wait until the "main-page" is present
    When I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "inscricao_ucs_pickup_button" button
    And I tap the "add_ucs" button

  Scenario: Increver na primeira UC
    Given I wait until the "main-page" is present
    When I tap the "sidemenu" button
    And I open the drawer
    And I tap the "PickUP_menu_button" button
    And I tap the "inscricao_ucs_pickup_button" button
    And I tap the "add_ucs" button
    And I tap the "adicionar_uc" button

