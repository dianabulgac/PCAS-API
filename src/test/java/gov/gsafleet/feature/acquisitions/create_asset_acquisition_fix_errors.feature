

Feature: Create asset acquisition request based on des documentation and collect and fix errors
  Background:
    * url baseUrl
       # soap is just an HTTP POST, so here we set the required header manually ..
    * header Authorization = call read('basic-auth.js')

    * configure afterScenario =
    """
    function(){
    var info = karate.info;
    karate.log(info);
    if(info.errorMessage){
    karate.call('Rerun.feature')}}
    """
  Scenario: Call asset acquisition with correct xml

    Given request
  """
  <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:fa="http://assetacquisition.impl.webservices.ams.com" xmlns:doc="http://doc.fa.domain.momentum.ams.com/" xmlns:ref="http://ref.gs.domain.momentum.ams.com/" xmlns:wor="http://workflow.gs.domain.momentum.ams.com/" xmlns:gen="http://general.fo.domain.momentum.ams.com/" xmlns:doc1="http://doc.gs.domain.momentum.ams.com/">
   <soap:Header/>
   <soap:Body>
      <fa:create>
         <fa:MomentumAssetAcquisition>
            <doc:accountingPeriod>02/23</doc:accountingPeriod>
            <doc:accrualUpdateAcquisitionCostFlag>false</doc:accrualUpdateAcquisitionCostFlag>
            <doc:acquisitionCostAmount>41337.28</doc:acquisitionCostAmount>
            <doc:acquisitionDate>2022-11-02</doc:acquisitionDate>
            <doc:acquisitionMethod>PURCHASE</doc:acquisitionMethod>
            <doc:MomentumAssetAcquisitionLineRelation>
               <doc:MomentumAssetAcquisitionLine>
                  <doc:activity>AF410</doc:activity>
                  <doc:beginningBudgetFiscalYear>2023</doc:beginningBudgetFiscalYear>
                  <doc:description>FA Example</doc:description>
                  <doc:division>02</doc:division>
                  <doc:fund>285F</doc:fund>
                  <doc:lineNumber>1</doc:lineNumber>
                  <doc:organization>Q00MDZ12</doc:organization>
                  <doc:program>TM11</doc:program>
                  <doc:transactionAmount>41337.28</doc:transactionAmount>
                  <doc:transactionType>01</doc:transactionType>
                  <doc:userDimension2>A01</doc:userDimension2>
                  <doc:userDimension3></doc:userDimension3>
               </doc:MomentumAssetAcquisitionLine>
            </doc:MomentumAssetAcquisitionLineRelation>
            <doc:assetNumber>1FVHG3DX3D78PO747</doc:assetNumber>
            <doc:assetType>VEHICLE</doc:assetType>
            <doc:capitalizedIndicator>true</doc:capitalizedIndicator>
            <doc:depreciationMethod>SL</doc:depreciationMethod>
            <doc:description>FA Example</doc:description>
            <doc:documentDate>2022-11-02</doc:documentDate>
            <doc:documentNumber>F1202211024118</doc:documentNumber>
            <doc:documentType>F1</doc:documentType>
            <doc:externalSystemId>GSAFLTGOV</doc:externalSystemId>
            <doc:fuelCode>FUEL</doc:fuelCode>
            <doc:initialServiceDate>2022-11-02</doc:initialServiceDate>
            <doc:paymentUpdateAcquisitionCostFlag>false</doc:paymentUpdateAcquisitionCostFlag>
            <doc:quantity>1</doc:quantity>
            <doc:salvageValueAmount>4133.72</doc:salvageValueAmount>
            <doc:securityOrganization>GSA</doc:securityOrganization>
            <doc:title>FA Example</doc:title>
            <doc:usefulLife>95</doc:usefulLife>
            <doc:vendorAddressCode>00001</doc:vendorAddressCode>
            <doc:vendorCode>NF0000000</doc:vendorCode>
            <doc:yearOfManufacture>2022</doc:yearOfManufacture>
         </fa:MomentumAssetAcquisition>
      </fa:create>
   </soap:Body>
</soap:Envelope>



  """
    * configure connectTimeout = 30000


    And header Content-Type = 'application/soap+xml; charset=utf-8'
    # .. and then we use the 'method keyword' instead of 'soap action'
    And path  "/FAFixedAsset"
    When method post
    Then status 200
    * print response
    * string response = response
    * def accessErrorClass = Java.type('gov.gsafleet.feature.acquisitions.ErrorExtraction')
    * def errors = accessErrorClass.errorExtraction(response)
    * print errors
    * def size = accessErrorClass.errorSize(errors)
   And match size == 0
    * def stringRequest = accessErrorClass.fixException(errors)


    Given request read('modified.xml')


    #* header Authorization = call read('basic-auth.js')
   # * configure connectTimeout = 30000
    # .. and then we use the 'soap action'

   # And header Content-Type = 'application/soap+xml; charset=utf-8'
    # .. and then we use the 'method keyword' instead of 'soap action'
    #And path  "/FAFixedAsset"
   # When method post
   # Then status 200
   # * print response
   # * string response = response
   # * def listErro = Java.type('gov.gsafleet.feature.acquisitions.ErrorExtraction')
   # * def errors = accessErrorClass.errorExtraction(response)
  #  * print errors