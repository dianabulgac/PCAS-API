Feature: post a new asset acq in the database

  Background:
    * def DbUtils = Java.type("gov.gsafleet.feature.acquisitions.DbUtils")
    * def config = {url : jdbc:mysql://afp-dev.fleet-dev.fcs.gsa.gov:3306/bm_pegasys, username : dianabulgac, password :Afp2022!, driver :'com.mysql.jdbc.Driver'}
    * def db = new DbUtils(config)

    * configure afterScenario =
    """
    function(){
    var info = karate.info;
    karate.log(info);
    if(info.errorMessage){
    karate.call('Rerun.feature')}}
    """

  Scenario: create an asset acquisition and make sure is there

    * def query = 'read(‘create_asset_in_database.txt’)'
    * db.insertRows(query)

