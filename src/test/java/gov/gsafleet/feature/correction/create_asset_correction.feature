Feature: Create asset transfer request based on des documentation and collect and fix errors
  Background:
    * url baseUrl
       # soap is just an HTTP POST, so here we set the required header manually ..
    * header Authorization = call read('basic-auth.js')
@create
  Scenario: Call asset correction with correct xml

    Given request
  """
 <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:fa="http://assetcorrection.impl.webservices.ams.com" xmlns:doc="http://doc.fa.domain.momentum.ams.com/" xmlns:ref="http://ref.gs.domain.momentum.ams.com/" xmlns:wor="http://workflow.gs.domain.momentum.ams.com/" xmlns:gen="http://general.fo.domain.momentum.ams.com/" xmlns:doc1="http://doc.gs.domain.momentum.ams.com/">
   <soap:Header/>
   <soap:Body>
      <fa:create>
         <fa:MomentumAssetCorrection>
            <doc:accountingPeriod>10/2022</doc:accountingPeriod>
            <doc:accrualUpdateAcquisitionCostFlag>false</doc:accrualUpdateAcquisitionCostFlag>
            <doc:acquisitionCostAmount>42337.28</doc:acquisitionCostAmount>
            <doc:acquisitionDate>2022-07-14</doc:acquisitionDate>
            <doc:acquisitionMethod>PURCHASE</doc:acquisitionMethod>
            <doc:MomentumAssetCorrectionLineRelation>
               <doc:MomentumAssetCorrectionLine>
                  <doc:activity>AF410</doc:activity>
                  <doc:beginningBudgetFiscalYear>2022</doc:beginningBudgetFiscalYear>
                  <doc:description>FC Example</doc:description>
                  <doc:division>02</doc:division>
                  <doc:fund>285F</doc:fund>
                  <doc:lineNumber>1</doc:lineNumber>
                  <doc:organization>Q00MDZ12</doc:organization>
                  <doc:program>TM11</doc:program>
                  <doc:transactionAmount>41337.28</doc:transactionAmount>
                  <doc:transactionType>01</doc:transactionType>
                  <doc:userDimension2>A01</doc:userDimension2>
                  <doc:userDimension3>G623201Y</doc:userDimension3>
               </doc:MomentumAssetCorrectionLine>
            </doc:MomentumAssetCorrectionLineRelation>
            <doc:assetNumber>ASSETEXAMPLE</doc:assetNumber>
            <doc:assetType>VEHICLE</doc:assetType>
            <doc:bettermentNumber>1</doc:bettermentNumber>
            <doc:capitalizedIndicator>true</doc:capitalizedIndicator>
            <doc:depreciationMethod>SL</doc:depreciationMethod>
            <doc:description>FC Example</doc:description>
            <doc:documentDate>2022-07-14</doc:documentDate>
            <doc:documentNumber>F2202207140000</doc:documentNumber>
            <doc:documentType>F2</doc:documentType>
            <doc:externalSystemId>GSAFLTGOV</doc:externalSystemId>
            <doc:fuelCode>FUEL</doc:fuelCode>
            <doc:initialServiceDate>2022-07-14</doc:initialServiceDate>
            <doc:newUsefulLife>100</doc:newUsefulLife>
            <doc:paymentUpdateAcquisitionCostFlag>false</doc:paymentUpdateAcquisitionCostFlag>
            <doc:quantity>1</doc:quantity>
            <doc:salvageValueAmount>4133.72</doc:salvageValueAmount>
            <doc:securityOrganization>GSA</doc:securityOrganization>
            <doc:title>FC Example</doc:title>
            <doc:usefulLife>95</doc:usefulLife>
            <doc:vendorAddressCode>00001</doc:vendorAddressCode>
            <doc:vendorCode>NF0000000</doc:vendorCode>
            <doc:yearOfManufacture>2022</doc:yearOfManufacture>
         </fa:MomentumAssetCorrection>
      </fa:create>
   </soap:Body>
</soap:Envelope>




  """
    * configure connectTimeout = 30000
    # .. and then we use the 'soap action'

    And header Content-Type = 'application/soap+xml; charset=utf-8'
    # .. and then we use the 'method keyword' instead of 'soap action'
    And path  "/FCFixedAsset"
    When method post
    Then status 200
    * print response
    * string response = response
