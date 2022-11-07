@create
Feature: Create asset acquisition request data driven

  Background:
    * url baseUrl
       # soap is just an HTTP POST, so here we set the required header manually ..
    * header Authorization = call read('basic-auth.js')


@AFP-47776 @AFP-47696
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
            <doc:acquisitionDate>2022/11/03</doc:acquisitionDate>
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
            <doc:documentDate>2022/11/03</doc:documentDate>
            <doc:documentNumber><document number></doc:documentNumber>
            <doc:documentType>F1</doc:documentType>
            <doc:externalSystemId>GSAFLTGOV</doc:externalSystemId>
            <doc:fuelCode>FUEL</doc:fuelCode>
            <doc:initialServiceDate>2022/11/03</doc:initialServiceDate>
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
     # | 02/2023        | 2022/11/02       | PURCHASE  | AF410    | 02       | 285F | 1           | Q00MDZ12     | TM11    | 01               | A02           | 1VAEWXCRTMKQ91402 | 2022/11/01    | F1202211033851  | 2022/11/01           | 02     |
     # | 02/2023        | 2022/11/02       | DONATION  | AF410    | 02       | 285F | 1           | Q00MDZ12     | TM11    | 01               | A02           | 1VAAA6CV1BCX08902 | 2022/11/01    | F1202211033852  | 2022/11/01           | 02     |
     # | 02/2023        | 2022/11/02       | FORFEIT   | AF410    | 02       | 285F | 1           | Q00MDZ12     | TM11    | 01               | A02           | 1VACU9F53V6T59912 | 2022/11/01    | F1202211033853  | 2022/11/01           | 02     |
     # | 02/2023        | 2022/11/02       | EXCESS    | AF410    | 02       | 285F | 1           | Q00MDZ12     | TM11    | 01               | A02           | 1VACU0U47EUBD8852 | 2022/11/01    | F1202211033844  | 2022/11/01           | 02     |
      #| 02/2023        | 2022/11/01       | NOREIMBIN | AF410    | 02       | 285F | 1           | Q00MDZ12     | TM11    | 01               | A02           | 1VA5K8AP8HGC58482 | 2022/11/01    | F1202211033855  | 2022/11/01           | 02     |
     # | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 01       | 285F | 1           | Q00MDZ11     | TM11    | 01               | A01           | 1VAJU5ET234A54742 | 2022/11/01    | F1202211033856  | 2022/11/01           | 01     |
    #  | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 03       | 285F | 1           | Q00MDZ13     | TM11    | 01               | A03           | 1VARF3BU8URD61712 | 2022/11/01    | F1202211033857  | 2022/11/01           | 03     |
     # | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 04       | 285F | 1           | Q00MDZ24     | TM11    | 01               | A04           | 1VAEW16T79KE71032 | 2022/11/01    | F1202211033858  | 2022/11/01           | 04     |
     # | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 05       | 285F | 1           | Q00MDZ25     | TM11    | 01               | A01           | 1VA8W3BGCVEF13722 | 2022/11/01    | F1202211033859  | 2022/11/01           | 05     |
   #   | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 06       | 285F | 1           | Q00MDZ36     | TM11    | 01               | A01           | 1VAVW89O6NYG08102 | 2022/11/01    | F1202211033860  | 2022/11/01           | 06     |
    #  | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 09       | 285F | 1           | Q00MDZ49     | TM11    | 01               | A09           | 1VA8W3B65TUF135O2 | 2022/11/01    | F1202211033863  | 2022/11/01           | 09     |
     # | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 10       | 285F | 1           | Q00MDZ40     | TM11    | 01               | A01           | 1VA8W3VCANEF08252 | 2022/11/01    | F1202211033865  | 2022/11/01           | 10     |
    #  | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 11       | 285F | 1           | Q00MDZ10     | TM11    | 01               | A11           | 1VACU0FTR45B54O72 | 2022/11/01    | F1202211033866  | 2022/11/01           | 11     |
    #  | 02/2023        | 2022/11/01       | REIMBIN   | AF410    | 00       | 285F | 1           | Q00MD100     | TM11    | 01               | A00           | 1VAWSAECXYR2724P2 | 2022/11/01    | F1202211033871  | 2022/11/01           | 00     |
      #| 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 10       | 285F | 1           | Q00MDZ40     | TM11    | 01               | A02           | 1VA8W3D71NEF082O2 | 2022/11/01    | F1202211033867  | 2022/11/01           | 10     |
      #| 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 10       | 285F | 1           | Q00MDZ40     | TM11    | 01               | A04           | 1VA8W3D69NAEB8252 | 2022/11/01    | F1202211033868  | 2022/11/01           | 10     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 01       | 285F | 1           | Q00MDZ11     | TM11    | 01               | A01           | 2QWEW16T79KE710Q2 | 2022/11/01    | F1202211033978  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 02       | 285F | 1           | Q00MDZ12     | TM11    | 01               | A04           | 2WAEW16T79KE710Q3 | 2022/11/01    | F1202211033979  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 03       | 285F | 1           | Q00MDZ13     | TM11    | 01               | A02           | 2EAEW16T79KE710Q4 | 2022/11/01    | F1202211033980  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 03       | 285F | 1           | Q00MDZ13     | TM11    | 01               | A04           | 2VAEW16T79KE710Q5 | 2022/11/01    | F1202211033981  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 03       | 285F | 1           | Q00MDZ13     | TM11    | 01               | A06           | 2RAEW16T79KE710Q6 | 2022/11/01    | F1202211033982  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 03       | 285F | 1           | Q00MDZ13     | TM11    | 01               | A07           | 2TAEW16T79KE710Q8 | 2022/11/01    | F1202211033983  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 03       | 285F | 1           | Q00MDZ13     | TM11    | 01               | A08           | 2YAEW16T79KE710Q9 | 2022/11/01    | F1202211033984  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 03       | 285F | 1           | Q00MDZ13     | TM11    | 01               | A27           | 2UAEW16T79KE710Q9 | 2022/11/01    | F1202211033985  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 04       | 285F | 1           | Q00MDZ24     | TM11    | 01               | A01           | 2IAEW16T79KE71Q32 | 2022/11/01    | F1202211033986  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 04       | 285F | 1           | Q00MDZ24     | TM11    | 01               | A06           | 2OAEW16T79KE7Q032 | 2022/11/01    | F1202211033987  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 04       | 285F | 1           | Q00MDZ24     | TM11    | 01               | A08           | 2PAEW16T79KQ71032 | 2022/11/01    | F1202211033988  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 04       | 285F | 1           | Q00MDZ24     | TM11    | 01               | A12           | 20AEW16T79KE71032 | 2022/11/01    | F1202211033989  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 05       | 285F | 1           | Q00MDZ25     | TM11    | 01               | A08           | 2PAEW16T79KQ61032 | 2022/11/01    | F1202211033990  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 05       | 285F | 1           | Q00MDZ25     | TM11    | 01               | A11           | 6PAEW16T79KE7Q432 | 2022/11/01    | F1202211033991  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 06       | 285F | 1           | Q00MDZ36     | TM11    | 01               | A04           | 2AAEW16T7ASE71032 | 2022/11/01    | F1202211033992  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 07       | 285F | 1           | Q00MDZ37    | TM11    | 01               | A06           | 2SNMW16T79KE71032 | 2022/11/01    | F1202211033993  | 2022/11/01           | 04     |
      | 02/2023        | 2022/11/01       | PURCHASE  | AF410    | 07       | 285F | 1           | Q00MDZ37     | TM11    | 01               | A01           | S3AEW16T79MV71032 | 2022/11/01    | F1202211033994  | 2022/11/01           | 04     |

