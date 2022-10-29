Feature: Create asset transfer request based on des documentation and collect and fix errors
Background:
 * url baseUrl
       # soap is just an HTTP POST, so here we set the required header manually ..
* header Authorization = call read('basic-auth.js')
@create
  Scenario: Call asset transfer with correct xml

    Given request
  """
  <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:fa="http://transfer.impl.webservices.ams.com" xmlns:doc="http://doc.fa.domain.momentum.ams.com/" xmlns:ref="http://ref.gs.domain.momentum.ams.com/" xmlns:wor="http://workflow.gs.domain.momentum.ams.com/" xmlns:gen="http://general.fo.domain.momentum.ams.com/" xmlns:doc1="http://doc.gs.domain.momentum.ams.com/">
   <soap:Header/>
   <soap:Body>
      <fa:create>
         <fa:MomentumAssetTransfer>
            <doc:accountingPeriod>10/2022</doc:accountingPeriod>
            <doc:assetNumber>ASSETEXAMPLE</doc:assetNumber>
            <doc:assetType>VEHICLE</doc:assetType>
            <doc:bettermentNumber>1</doc:bettermentNumber>
            <doc:description>FT Example</doc:description>
            <doc:dispositionTransactionType>02</doc:dispositionTransactionType>
            <doc:documentDate>2022-07-25</doc:documentDate>
            <doc:documentNumber>F5202207250104</doc:documentNumber>
            <doc:documentType>F5</doc:documentType>
            <doc:externalSystemId>GSAFLTGOV</doc:externalSystemId>
            <doc:newAssetNumber>ASSETEXAMPLE</doc:newAssetNumber>
            <doc:newAssetType>VEHSURPLUS</doc:newAssetType>
            <doc:newCapitalizedIndicator>true</doc:newCapitalizedIndicator>
            <doc:securityOrganization>GSA</doc:securityOrganization>
            <doc:title>FT Example</doc:title>
            <doc:transferDate>2022-07-25</doc:transferDate>
            <doc:MomentumAssetTransferLineRelation>
               <doc:MomentumAssetTransferLine>
                  <doc:activity>AF410</doc:activity>
                  <doc:beginningBudgetFiscalYear>2022</doc:beginningBudgetFiscalYear>
                  <doc:description>FT Example</doc:description>
                  <doc:division>02</doc:division>
                  <doc:fund>285F</doc:fund>
                  <doc:lineNumber>1</doc:lineNumber>
                  <doc:organization>Q00MDZ12</doc:organization>
                  <doc:program>TM11</doc:program>
                  <doc:transactionAmount>41337.28</doc:transactionAmount>
                  <doc:transactionType>02</doc:transactionType>
                  <doc:userDimension2>A01</doc:userDimension2>
                  <doc:userDimension3>G623201Y</doc:userDimension3>
               </doc:MomentumAssetTransferLine>
            </doc:MomentumAssetTransferLineRelation>
            <doc:transferMethod>T</doc:transferMethod>
            <doc:transferType>A</doc:transferType>
         </fa:MomentumAssetTransfer>
      </fa:create>
   </soap:Body>
</soap:Envelope>


  """
     * configure connectTimeout = 30000
    # .. and then we use the 'soap action'

     And header Content-Type = 'application/soap+xml; charset=utf-8'
    # .. and then we use the 'method keyword' instead of 'soap action'
     And path  "/FTFixedAsset"
     When method post
     Then status 200
     * print response
     * string response = response
     * def listErro = Java.type('gov.gsafleet.feature.transfer.ErrorExtraction')
     * def encoded = listErro.errorExtraction(response)
     * print encoded
     * def strQest = listErro.fixException(encoded)
     * print strQest


     Given request read('modified.xml')


     * header Authorization = call read('basic-auth.js')
     * configure connectTimeout = 30000
    # .. and then we use the 'soap action'

     And header Content-Type = 'application/soap+xml; charset=utf-8'
    # .. and then we use the 'method keyword' instead of 'soap action'
     And path  "/FTFixedAsset"
     When method post
     Then status 200
     * print response
     * string response = response
     * def listErro = Java.type('gov.gsafleet.feature.transfer.ErrorExtraction')
     * def encoded = listErro.errorExtraction(response)
     * print encoded