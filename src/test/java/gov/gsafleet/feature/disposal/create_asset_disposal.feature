Feature: Create asset transfer request based on des documentation and collect and fix errors
  Background:
    * url baseUrl
       # soap is just an HTTP POST, so here we set the required header manually ..
    * header Authorization = call read('basic-auth.js')
@create
  Scenario: Call asset transfer with correct xml

    Given request
  """
 <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:fa="http://disposal.impl.webservices.ams.com" xmlns:doc="http://doc.fa.domain.momentum.ams.com/" xmlns:ref="http://ref.gs.domain.momentum.ams.com/" xmlns:wor="http://workflow.gs.domain.momentum.ams.com/" xmlns:gen="http://general.fo.domain.momentum.ams.com/" xmlns:doc1="http://doc.gs.domain.momentum.ams.com/">
   <soap:Header/>
   <soap:Body>
      <fa:create>
         <fa:MomentumAssetDisposal>
            <doc:accountingPeriod>10/2022</doc:accountingPeriod>
            <doc:description>FD Example</doc:description>
            <doc:MomentumAssetDisposalLineRelation>
               <doc:MomentumAssetDisposalLine>
                  <doc:assetNumber>ASSETEXAMPLE</doc:assetNumber>
                  <doc:assetType>VEHSURPLUS</doc:assetType>
                  <doc:description>FD Example</doc:description>
                  <doc:dispositionDate>2022-07-26</doc:dispositionDate>
                  <doc:dispositionMethod>SALE</doc:dispositionMethod>
                  <doc:dispositionPriceAmount>1000</doc:dispositionPriceAmount>
                  <doc:dispositionType>A</doc:dispositionType>
                  <doc:lineNumber>1</doc:lineNumber>
                  <doc:transactionType>06</doc:transactionType>
               </doc:MomentumAssetDisposalLine>
            </doc:MomentumAssetDisposalLineRelation>
            <doc:documentDate>2022-07-26</doc:documentDate>
            <doc:documentNumber>F3202207260000</doc:documentNumber>
            <doc:documentType>F3</doc:documentType>
            <doc:externalSystemId>GSAFLTGOV</doc:externalSystemId>
            <doc:securityOrganization>GSA</doc:securityOrganization>
            <doc:title>FD Example</doc:title>
         </fa:MomentumAssetDisposal>
      </fa:create>
   </soap:Body>
</soap:Envelope>


  """
    * configure connectTimeout = 30000
    # .. and then we use the 'soap action'

    And header Content-Type = 'application/soap+xml; charset=utf-8'
    # .. and then we use the 'method keyword' instead of 'soap action'
    And path  "/FDFixedAsset"
    When method post
    Then status 200
    * print response
    * string response = response
