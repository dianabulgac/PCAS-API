Feature: Data base connection and validation

  Background:
    * def DbUtils = Java.type("gov.gsafleet.utils.DbUtils")
    * def db = new DbUtils
@wip
    Scenario: retrieve database information

      * def orders = db.readRows('select * from bm_pagasys.pegasys_order' )
      * print orders




