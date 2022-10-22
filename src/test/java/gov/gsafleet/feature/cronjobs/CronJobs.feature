Feature: cron jobs triggering

  Background:
    Given driver "https://dashboard.tools.fleet-dev.fcs.gsa.gov/#/login"
    And click('//span[text()='Token']
    And input('//input[@id='token']',cronToken)
    And click('//button[normalize-space()='Sign in'])
    And input('//span[text()='default']','shared')
    And click('//span[normalize-space()='Cron Jobs']')

    Scenario: user triggers a PCAS external job
    When click('//mat-cell[normalize-space()='shared-billing-svc-pcas-external-cron']/following-sibling::mat-cell/kd-dynamic-cell')
    And click('//button[text()='Trigger']')
      Then click('//span[normalize-space()='Jobs']')


