Feature: Correction unfilled  Customer Order Internal VID Transaction Data from AFP
  Background:
    # Create JDBC connection with DbUtils java class
    * def login = 'dianabulgac'
    * def password = 'Afp2022!'
    * def dbUrl = 'jdbc:mysql://afp-dev.fleet-dev.fcs.gsa.gov:3306/bm_pegasys'
    * def DbUtils = Java.type("gov.gsafleet.feature.acquisitions.DbUtils")
    * def db = new DbUtils(login,password,dbUrl)
    #Create an order in the database
    * def query = 'read(‘create_order_in_database.txt’)'
    * db.insertRows(query)

    Scenario: Price (unit price per GSA) increased on the order

      Given driver "https://dashboard.tools.fleet-dev.fcs.gsa.gov/#/login"
      And click('//span[text()='Token']
      And input('//input[@id='token']',cronToken)
      And click('//button[normalize-space()='Sign in'])
      And input('//span[text()='default']','shared')
      And click('//span[normalize-space()='Cron Jobs']')
      When click('//mat-cell[normalize-space()='shared-billing-svc-pcas-internal-cron']/following-sibling::mat-cell/kd-dynamic-cell')
      And click('//button[text()='Trigger']')
      Then click('//span[normalize-space()='Jobs']')
      * def activeOrder = db.readRow('read(‘create_order_in_database.txt’)')
