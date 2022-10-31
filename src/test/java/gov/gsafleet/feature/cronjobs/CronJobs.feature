


@ignore
Feature: cron jobs triggering

  Background:
    Given driver "https://dashboard.tools.fleet-dev.fcs.gsa.gov/#/login"
   # And click('//mat-radio-button[@id='mat-radio-2']')
   # And click('//mat-form-field')
    And input('//mat-form-field','eyJhbGciOiJSUzI1NiIsImtpZCI6IjNtX3JkQXBPUFdVM181Z1RZbFRzSEkwSUdtbHVLU251UjRjbGlJUzNGSEEifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJzaGFyZWQiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlY3JldC5uYW1lIjoicmVhZC1vbmx5LXRva2VuLXY0cXR4Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6InJlYWQtb25seSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjczYzJlYzgyLWNjZDgtNDY4Mi04YzBjLWU5Zjg1NzAzMGYxNyIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpzaGFyZWQ6cmVhZC1vbmx5In0.p9jxv7WrGp4_tsEmxx3Ad1qPA8C4l43XSI_oL2PSSzbLG3sCeXidVQM5zz7ghx9fHeMgUYPVDozeY33zoAo6_OYa17TpP7k8SkrqQnsnmwZPZXtje7Lej2pisQ3K5u5WHRpXAVgbfMx2fkn7_7uhoG38e2vmi5hThA4rnlF-lNXbCQLscMGUzGjooS472z6fyZEv7a37gfad_G6YNZV_XD2rXeqNrfiYvr2S78ZI9kS6X9uH3vPc9h4eFki4o59xgZ_pR9MV2UA0coJ6z3cBXEuojjnthXLxBqMyxTrzHXgJTBERQ40S6j3hYwXRO7U_T-ud07d8ahr-fWXRu9LVAA')
    And click('//button[@type='submit']')
    And input('//span[text()='default']','shared')
    And click('//span[normalize-space()='Cron Jobs']')

    Scenario: user triggers a PCAS external job
    When click('//mat-cell[normalize-space()='shared-billing-svc-pcas-external-cron']/following-sibling::mat-cell/kd-dynamic-cell')
    And click('//button[text()='Trigger']')
      Then click('//span[normalize-space()='Jobs']')


