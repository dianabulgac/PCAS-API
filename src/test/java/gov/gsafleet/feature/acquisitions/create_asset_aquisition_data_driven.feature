@create
Feature: Create asset acquisition request data driven

  Background:
    * url baseUrl
       # soap is just an HTTP POST, so here we set the required header manually ..
    * header Authorization = call read('basic-auth.js')



  Scenario Outline: Call asset acquisition with correct xml data driven

    Given request
  """
  <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:fa="http://assetacquisition.impl.webservices.ams.com" xmlns:doc="http://doc.fa.domain.momentum.ams.com/" xmlns:ref="http://ref.gs.domain.momentum.ams.com/" xmlns:wor="http://workflow.gs.domain.momentum.ams.com/" xmlns:gen="http://general.fo.domain.momentum.ams.com/" xmlns:doc1="http://doc.gs.domain.momentum.ams.com/">
   <soap:Header/>
   <soap:Body>
      <fa:create>
         <fa:MomentumAssetAcquisition>
            <doc:accountingPeriod><account period></doc:accountingPeriod>
            <doc:accrualUpdateAcquisitionCostFlag>false</doc:accrualUpdateAcquisitionCostFlag>
            <doc:acquisitionCostAmount>41337.28</doc:acquisitionCostAmount>
            <doc:acquisitionDate>2022/11/02</doc:acquisitionDate>
            <doc:acquisitionMethod><a method></doc:acquisitionMethod>
            <doc:MomentumAssetAcquisitionLineRelation>
               <doc:MomentumAssetAcquisitionLine>
                  <doc:activity><activity></doc:activity>
                  <doc:beginningBudgetFiscalYear>2023</doc:beginningBudgetFiscalYear>
                  <doc:description>FA Example</doc:description>
                  <doc:division><division></doc:division>
                  <doc:fund><fund></doc:fund>
                  <doc:lineNumber><line number></doc:lineNumber>
                  <doc:organization><organization></doc:organization>
                  <doc:program><program></doc:program>
                  <doc:transactionAmount>41337.28</doc:transactionAmount>
                  <doc:transactionType><transaction type></doc:transactionType>
                  <doc:userDimension2><userDimension></doc:userDimension2>
                  <doc:userDimension3></doc:userDimension3>
               </doc:MomentumAssetAcquisitionLine>
            </doc:MomentumAssetAcquisitionLineRelation>
            <doc:assetNumber><vin number></doc:assetNumber>
            <doc:assetType>VEHICLE</doc:assetType>
            <doc:capitalizedIndicator>true</doc:capitalizedIndicator>
            <doc:depreciationMethod>SL</doc:depreciationMethod>
            <doc:description>FA Example</doc:description>
            <doc:documentDate>2022/11/02</doc:documentDate>
            <doc:documentNumber><document number></doc:documentNumber>
            <doc:documentType>F1</doc:documentType>
            <doc:externalSystemId>GSAFLTGOV</doc:externalSystemId>
            <doc:fuelCode>FUEL</doc:fuelCode>
            <doc:initialServiceDate>2022/11/02</doc:initialServiceDate>
            <doc:paymentUpdateAcquisitionCostFlag>false</doc:paymentUpdateAcquisitionCostFlag>
            <doc:quantity>1</doc:quantity>
            <doc:salvageValueAmount>4133.72</doc:salvageValueAmount>
            <doc:securityOrganization>GSA</doc:securityOrganization>
            <doc:title>FA Example</doc:title>
            <doc:usefulLife>95</doc:usefulLife>

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

    Examples:

      | account period | acquisition date | a method  | activity | division | fund | line number | organization | program | transaction type | userDimension | vin number        | document data | document number | initial service date | region |
      | 02/2023        | 2022/11/02       | PURCHASE  | AF410    | 02       | 285F | 1           | Q00MDZ12     | TM11    | 01               | A02           | 1VAEWXCRTMKQ9140P | 2022/11/01    | F1202211023851  | 2022/11/01           | 02     |
      | 02/2023        | 2022/11/02       | DONATION  | AF410    | 02       | 285F | 1           | Q00MDZ12     | TM11    | 01               | A02           | 1VAAA6CV1BCX0890O | 2022/11/01    | F1202211023852  | 2022/11/01           | 02     |
      | 02/2023        | 2022/11/02       | FORFEIT   | AF410    | 02       | 285F | 1           | Q00MDZ12     | TM11    | 01               | A02           | 1VACU9F53V6T5991P | 2022/11/01    | F1202211023853  | 2022/11/01           | 02     |
      | 02/2023        | 2022/11/02       | EXCESS    | AF410    | 02       | 285F | 1           | Q00MDZ12     | TM11    | 01               | A02           | 1VACU0U47EUBD885O | 2022/11/01    | F1202211023844  | 2022/11/01           | 02     |
      | 02/2023        | 2022/11/01       | NOREIMBIN | AF410    | 02       | 285F | 1           | Q00MDZ12     | TM11    | 01               | A02           | 1VA5K8AP8HGC5848I | 2022/11/01    | F1202211023855  | 2022/11/01           | 02     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 01       | 285F | 1           | Q00MDZ11     | TM11    | 01               | A01           | 1VAJU5ET234A54748 | 2022/11/01    | F1202211023856  | 2022/11/01           | 01     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 03       | 285F | 1           | Q00MDZ13     | TM11    | 01               | A03           | 1VARF3BU8URD6171P | 2022/11/01    | F1202211023857  | 2022/11/01           | 03     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 04       | 285F | 1           | Q00MDZ24     | TM11    | 01               | A04           | 1VAEW16T79KE7103O | 2022/11/01    | F1202211023858  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 05       | 285F | 1           | Q00MDZ25     | TM11    | 01               | A01           | 1VA8W3BGCVEF1372U | 2022/11/01    | F1202211023859  | 2022/11/01           | 05     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 06       | 285F | 1           | Q00MDZ36     | TM11    | 01               | A01           | 1VAVW89O6NYG08108 | 2022/11/01    | F1202211023860  | 2022/11/01           | 06     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 09       | 285F | 1           | Q00MDZ49     | TM11    | 01               | A09           | 1VA8W3B65TUF135O1 | 2022/11/01    | F1202211023863  | 2022/11/01           | 09     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 10       | 285F | 1           | Q00MDZ40     | TM11    | 01               | A01           | 1VA8W3VCANEF0825P | 2022/11/01    | F1202211023865  | 2022/11/01           | 10     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 11       | 285F | 1           | Q00MDZ10     | TM11    | 01               | A11           | 1VACU0FTR45B54O71 | 2022/11/01    | F1202211023866  | 2022/11/01           | 11     |
      | 02/2023        | 2022/11/01       | REIMBIN   | AF410    | 00       | 285F | 1           | Q00MD100     | TM11    | 01               | A00           | 1VAWSAECXYR2724P6 | 2022/11/01    | F1202211023871  | 2022/11/01           | 00     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 10       | 285F | 1           | Q00MDZ40     | TM11    | 01               | A02           | 1VA8W3D71NEF082O4 | 2022/11/01    | F1202211023867  | 2022/11/01           | 10     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 10       | 285F | 1           | Q00MDZ40     | TM11    | 01               | A04           | 1VA8W3D69NAEB825P | 2022/11/01    | F1202211023868  | 2022/11/01           | 10     |

