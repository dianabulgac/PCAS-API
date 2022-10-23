Feature: Create order using DES specification
  Background:
    * url baseUrl
       # soap is just an HTTP POST, so here we set the required header manually ..
    * header Authorization = call read('basic-auth.js') { username: longin, password: password }

  Scenario Outline: Call asset transfer with correct xml

    Given request
  """
  <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:fa="http://assetacquisition.impl.webservices.ams.com" xmlns:doc="http://doc.fa.domain.momentum.ams.com/" xmlns:ref="http://ref.gs.domain.momentum.ams.com/" xmlns:wor="http://workflow.gs.domain.momentum.ams.com/" xmlns:gen="http://general.fo.domain.momentum.ams.com/" xmlns:doc1="http://doc.gs.domain.momentum.ams.com/">
   <soap:Header/>
   <soap:Body>
      <fa:create>
         <fa:MomentumAssetAcquisition>
            <doc:accountingPeriod><accounting period></doc:accountingPeriod>
            <doc:accrualUpdateAcquisitionCostFlag><update acquisition cost></doc:accrualUpdateAcquisitionCostFlag>
            <doc:acquisitionCostAmount><acquisition cost amount></doc:acquisitionCostAmount>
            <doc:acquisitionDate><acquisition date></doc:acquisitionDate>
            <doc:acquisitionMethod><acquisition method></doc:acquisitionMethod>
            <doc:MomentumAssetAcquisitionLineRelation>
               <doc:MomentumAssetAcquisitionLine>
                  <doc:activity><activity></doc:activity>
                  <doc:beginningBudgetFiscalYear><beginning budget FY></doc:beginningBudgetFiscalYear>
                  <doc:description><description></doc:description>
                  <doc:division><division></doc:division>
                  <doc:fund><fund></doc:fund>
                  <doc:lineNumber><line number></doc:lineNumber>
                  <doc:organization><organization></doc:organization>
                  <doc:program>'#(<program>)'</doc:program>
                  <doc:transactionAmount><transaction amount></doc:transactionAmount>
                  <doc:transactionType><transaction type></doc:transactionType>
                  <doc:userDimension2><user dimension 2></doc:userDimension2>
                  <doc:userDimension3><user dimension 3></doc:userDimension3>
               </doc:MomentumAssetAcquisitionLine>
            </doc:MomentumAssetAcquisitionLineRelation>
            <doc:assetNumber><asset number></doc:assetNumber>
            <doc:assetType><asset type></doc:assetType>
            <doc:capitalizedIndicator><capital indicator></doc:capitalizedIndicator>
            <doc:depreciationMethod><depreciation method></doc:depreciationMethod>
            <doc:description><description></doc:description>
            <doc:documentDate><document date></doc:documentDate>
            <doc:documentNumber><document number></doc:documentNumber>
            <doc:documentType><document type></doc:documentType>
            <doc:externalSystemId><external system id></doc:externalSystemId>
            <doc:fuelCode><fuel></doc:fuelCode>
            <doc:initialServiceDate><initial service date></doc:initialServiceDate>
            <doc:paymentUpdateAcquisitionCostFlag><payment update cost flag></doc:paymentUpdateAcquisitionCostFlag>
            <doc:quantity><quantity></doc:quantity>
            <doc:salvageValueAmount><salvage amount></doc:salvageValueAmount>
            <doc:securityOrganization><security organization></doc:securityOrganization>
            <doc:title><title></doc:title>
            <doc:usefulLife><useful life></doc:usefulLife>
            <doc:vendorAddressCode><vendor address code></doc:vendorAddressCode>
            <doc:vendorCode><vendor code></doc:vendorCode>
            <doc:yearOfManufacture><year of manufacturing></doc:yearOfManufacture>
         </fa:MomentumAssetAcquisition>
      </fa:create>
   </soap:Body>
</soap:Envelope>

  """
      # .. and then we use the 'soap action'
     When soap action 'http://FAFixedAsset'
     Then status 200
    # note how we focus only on the relevant part of the payload and read expected XML from a file
     And print response
     And match /Envelope/Header/Body == read('successful_response.xml')

     Examples:
     |read('data.csv')|