Feature: Data base connection and validation

  Background:
    * def DbUtils = Java.type("gov.gsafleet.feature.acquisitions.DbUtils")
    * def db = new DbUtils
@ignore
    Scenario: retrieve database information

      * def orders = db.readRows('select * from bm_pagasys.pegasys_order')
      * print orders




