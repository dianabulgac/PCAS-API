Feature: print hello world

  Scenario: Hello world
    *print 'Hello world'
    
    Scenario: declare and print variable

      * def balance = 200
      * def fee = 20
      * def tax = 10

      * print 'total amount ->' + ( balance + fee + tax )