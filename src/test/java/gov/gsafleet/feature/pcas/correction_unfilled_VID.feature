Feature: Correction unfilled  Customer Order Internal VID Transaction Data from AFP
  Background:
    # Create JDBC connection with DbUtils java class
    * def login = Java.type(ConfigurationReader.getProperty("db_login")
    * def password = Java.type(ConfigurationReader.getProperty("db_password")
    * def url = 'afp-masked.fleet-test.fcs.gsa.gov'
    * def DbUtils = Java.type(‘util.DBUtils’)
    * def db = new DBUtils(login,password,url)
    #Create an order in the database
    * def query = 'read(‘insert_query.txt’)'
    * db.insertRows(query)
