Feature: Create asset transfer request based on des documentation and collect and fix errors
Background:
 * url baseUrl
       # soap is just an HTTP POST, so here we set the required header manually ..
* header Authorization = call read('basic-auth.js')

  Scenario: Call asset transfer with correct xml

    Given request
  """
  <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:fa="http://transfer.impl.webservices.ams.com" xmlns:doc="http://doc.fa.domain.momentum.ams.com/" xmlns:ref="http://ref.gs.domain.momentum.ams.com/" xmlns:wor="http://workflow.gs.domain.momentum.ams.com/" xmlns:gen="http://general.fo.domain.momentum.ams.com/" xmlns:doc1="http://doc.gs.domain.momentum.ams.com/">
   <soap:Header/>
   <soap:Body>
      <fa:create>
         <fa:MomentumAssetTransfer>
            <doc:accountingPeriod>02/2023</doc:accountingPeriod>
            <doc:assetNumber>1FMJU1GT2MEA54743</doc:assetNumber>
            <doc:assetType>VEHICLE</doc:assetType>
            <doc:bettermentNumber>0</doc:bettermentNumber>
            <doc:description>FT Example</doc:description>
            <doc:dispositionTransactionType>02</doc:dispositionTransactionType>
            <doc:documentDate>2022-11-03</doc:documentDate>
            <doc:documentNumber>F1202211010336</doc:documentNumber>
            <doc:documentType>F5</doc:documentType>
            <doc:externalSystemId>GSAFLTGOV</doc:externalSystemId>
            <doc:newAssetNumber>1FMJU1GT2MEA54743</doc:newAssetNumber>
            <doc:newAssetType>VEHSURPLUS</doc:newAssetType>
            <doc:newCapitalizedIndicator>true</doc:newCapitalizedIndicator>
            <doc:securityOrganization>GSA</doc:securityOrganization>
            <doc:title>FT Example</doc:title>
            <doc:transferDate>2022-11-03</doc:transferDate>
            <doc:MomentumAssetTransferLineRelation>
               <doc:MomentumAssetTransferLine>
                  <doc:activity>AF410</doc:activity>
                  <doc:beginningBudgetFiscalYear>2023</doc:beginningBudgetFiscalYear>
                  <doc:description>FT Example</doc:description>
                  <doc:division>01</doc:division>
                  <doc:fund>285F</doc:fund>
                  <doc:lineNumber>1</doc:lineNumber>
                  <doc:organization>Q00MDZ11</doc:organization>
                  <doc:program>TM11</doc:program>
                  <doc:transactionAmount></doc:transactionAmount>
                  <doc:transactionType>02</doc:transactionType>
                  <doc:userDimension2>A01</doc:userDimension2>
                  <doc:userDimension3></doc:userDimension3>
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
   * def accessErrorClass = Java.type('gov.gsafleet.feature.acquisitions.ErrorExtraction')
   * def errors = accessErrorClass.errorExtraction(response)
   * print errors
   * def size = accessErrorClass.errorSize(errors)
   And match size == 0


   @AFP-47781 @AFP-47696
   Scenario Outline:  Create asset transfer request based on des documentation data driven testing

      Given request
  """
  <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:fa="http://transfer.impl.webservices.ams.com" xmlns:doc="http://doc.fa.domain.momentum.ams.com/" xmlns:ref="http://ref.gs.domain.momentum.ams.com/" xmlns:wor="http://workflow.gs.domain.momentum.ams.com/" xmlns:gen="http://general.fo.domain.momentum.ams.com/" xmlns:doc1="http://doc.gs.domain.momentum.ams.com/">
   <soap:Header/>
   <soap:Body>
      <fa:create>
         <fa:MomentumAssetTransfer>
            <doc:accountingPeriod>02/2023</doc:accountingPeriod>
            <doc:newAcquisitionDate>2022-11-03</doc:newAcquisitionDate>
            <doc:assetNumber><vin></doc:assetNumber>
            <doc:assetType>VEHSURPLUS</doc:assetType>
            <doc:bettermentNumber>0</doc:bettermentNumber>
            <doc:description>FT Example</doc:description>
            <doc:dispositionTransactionType>02</doc:dispositionTransactionType>
            <doc:documentDate>2022-11-03</doc:documentDate>
            <doc:documentNumber>F520221103<doc number></doc:documentNumber>
            <doc:documentType>F5</doc:documentType>
            <doc:externalSystemId>GSAFLTGOV</doc:externalSystemId>
            <doc:newAssetNumber><new vin></doc:newAssetNumber>
            <doc:newAssetType>VEHICLE</doc:newAssetType>
            <doc:newCapitalizedIndicator>true</doc:newCapitalizedIndicator>
            <doc:securityOrganization>GSA</doc:securityOrganization>
            <doc:depreciationMethod>SL</doc:depreciationMethod>
            <doc:title>FT Example</doc:title>
            <doc:transferDate>2022-11-03</doc:transferDate>
            <doc:MomentumAssetTransferLineRelation>
               <doc:MomentumAssetTransferLine>
                  <doc:activity>AF410</doc:activity>
                  <doc:beginningBudgetFiscalYear>2023</doc:beginningBudgetFiscalYear>
                  <doc:description>FT Example</doc:description>
                  <doc:division><region></doc:division>
                  <doc:fund>285F</doc:fund>
                  <doc:lineNumber>1</doc:lineNumber>
                  <doc:organization><organiza></doc:organization>
                  <doc:program>TM11</doc:program>
                  <doc:transactionAmount></doc:transactionAmount>
                  <doc:transactionType>04</doc:transactionType>
                  <doc:userDimension2><userDim></doc:userDimension2>
                  <doc:userDimension3></doc:userDimension3>
                  <doc:newSalvageValueAmount>4133.72</doc:newSalvageValueAmount>
                  <doc:usefulLife>95</doc:usefulLife>
               </doc:MomentumAssetTransferLine>
            </doc:MomentumAssetTransferLineRelation>
            <doc:transferMethod><method></doc:transferMethod>
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
      * def accessErrorClass = Java.type('gov.gsafleet.feature.acquisitions.ErrorExtraction')
      * def errors = accessErrorClass.errorExtraction(response)
      * print errors
      * def size = accessErrorClass.errorSize(errors)
     And match size == 0
     Examples:
       | vin               | doc number | new vin           | region | organiza | userDim | method |
       | 1VACU9F53V6T59912 | 3178       | 1VACU9F53V6T59912 | 02     | Q00MDZ12 | A02     | T      |
       |1VACU0U47EUBD8852 | 3179       |1VACU0U47EUBD8852 | 02     | Q00MDZ12 | A02     | T      |
       | 1VAJU5ET234A54742 | 3187       | 1VAJU5ET234A54742 | 01     | Q00MDZ11 | A01     | T      |
       | 1VARF3BU8URD61712 | 3188       |1VARF3BU8URD61712 | 03     | Q00MDZ13 | A03     | T      |


     @create @AFP-47637 @AFP-47856
  Scenario: Call asset transfer with  C correction type

    Given request
  """
  <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:fa="http://transfer.impl.webservices.ams.com" xmlns:doc="http://doc.fa.domain.momentum.ams.com/" xmlns:ref="http://ref.gs.domain.momentum.ams.com/" xmlns:wor="http://workflow.gs.domain.momentum.ams.com/" xmlns:gen="http://general.fo.domain.momentum.ams.com/" xmlns:doc1="http://doc.gs.domain.momentum.ams.com/">
   <soap:Header/>
   <soap:Body>
      <fa:create>
         <fa:MomentumAssetTransfer>
            <doc:accountingPeriod>02/2023</doc:accountingPeriod>
            <doc:assetNumber>S3AEW16T79MV71032</doc:assetNumber>
            <doc:assetType>VEHICLE</doc:assetType>
            <doc:bettermentNumber>1</doc:bettermentNumber>
            <doc:description>FT Example</doc:description>
            <doc:dispositionTransactionType>02</doc:dispositionTransactionType>
            <doc:documentDate>2022-11-03</doc:documentDate>
            <doc:documentNumber>F5202211010325</doc:documentNumber>
            <doc:documentType>F5</doc:documentType>
            <doc:externalSystemId>GSAFLTGOV</doc:externalSystemId>
            <doc:newAssetNumber>S3AEW16T79MV71032</doc:newAssetNumber>
            <doc:newAssetType>VEHSURPLUS</doc:newAssetType>
            <doc:newCapitalizedIndicator>true</doc:newCapitalizedIndicator>
            <doc:securityOrganization>GSA</doc:securityOrganization>
            <doc:title>FT Example</doc:title>
            <doc:transferDate>2022-11-04</doc:transferDate>
            <doc:MomentumAssetTransferLineRelation>
               <doc:MomentumAssetTransferLine>
                  <doc:activity>AF410</doc:activity>
                  <doc:beginningBudgetFiscalYear>2023</doc:beginningBudgetFiscalYear>
                  <doc:description>FT Example</doc:description>
                  <doc:division>07</doc:division>
                  <doc:fund>285F</doc:fund>
                  <doc:lineNumber>1</doc:lineNumber>
                  <doc:organization>Q00MDZ37</doc:organization>
                  <doc:program>TM11</doc:program>
                  <doc:transactionAmount></doc:transactionAmount>
                  <doc:transactionType>01</doc:transactionType>
                  <doc:userDimension2>A01</doc:userDimension2>
                  <doc:userDimension3></doc:userDimension3>
               </doc:MomentumAssetTransferLine>
            </doc:MomentumAssetTransferLineRelation>
            <doc:transferMethod>C</doc:transferMethod>
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
    * def accessErrorClass = Java.type('gov.gsafleet.feature.acquisitions.ErrorExtraction')
    * def errors = accessErrorClass.errorExtraction(response)
    * print errors
    * def size = accessErrorClass.errorSize(errors)
    And match size == 0
