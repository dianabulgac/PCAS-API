
  Feature: soap testing
    Scenario: test soap action
      Given request read('soap-request.xml')
      When soap action 'QueryUsageBalance'
      Then status 200
      And match response /Envelope/Body/QueryUsageBalanceResponse/Result/Error/Code == 'DAT_USAGE_1003'
      And match response /Envelope/Body/QueryUsageBalanceResponse == read('expected-response.xml')