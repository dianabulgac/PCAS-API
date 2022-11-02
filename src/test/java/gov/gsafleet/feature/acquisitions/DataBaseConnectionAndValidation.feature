Feature: Data base connection and validation

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

    Scenario: retrieve database information



      * def orders = db.readRows(" select * from pegasys_order where pegasys_order_id='2558935' order by updated_at desc;")
      * print orders
      And match orders[0].pegasys_order_id == 2558935



