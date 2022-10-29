Feature: Data testing transfer request

  Background:

    * url baseUrl
       # soap is just an HTTP POST, so here we set the required header manually ..
    * header Authorization = call read('../basic-auth.js') { username: longin, password: password }

  Scenario Outline: Call asset transfer with correct xml

    Given request
  """
  <?xml version="1.0" encoding="utf-8"?>
<soap:Envelope
        xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xmlns:ns="http://itemizedorder.impl.webservices.ams.com"
        xmlns:ns0="http://dms.domain.core.ams.com/"
        xmlns:ns1="http://org.apache.axis2/xsd"
        xmlns:ns2="http://security.sa.domain.momentum.ams.com/"
        xmlns:ns3="http://correspondence.domain.core.ams.com/"
        xmlns:ns4="http://exceptions.webservices.core.ams.com/"
        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/"
        xmlns:ns6="http://doc.gs.domain.momentum.ams.com/"
        xmlns:ns7="http://general.fo.domain.momentum.ams.com/"
        xmlns:ns8="http://workflow.gs.domain.momentum.ams.com/"
        xmlns:tns="http://ref.gs.domain.momentum.ams.com/"
        xmlns:ax235="http://doc.pe.domain.momentum.ams.com/">
    <soap:Header></soap:Header>
    <soap:Body>
        <ns:verifyAll
                xmlns:ns="http://itemizedorder.impl.webservices.ams.com"
                xmlns="http://itemizedorder.impl.webservices.ams.com">
            <ns:MomentumOrder>
                <ns5:accountingPeriod
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/"><accounting period>
                </ns5:accountingPeriod>
                <ns5:negotiatedPaymentDays
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">
                </ns5:negotiatedPaymentDays>
                <ns5:orderType
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/"><order type>
                </ns5:orderType>
                <ns5:externalSystemDocumentNumber
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">'#(<external system document number>)'>
                </ns5:externalSystemDocumentNumber>
                <ns5:description
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/" xsi:nil="true">
                </ns5:description>
                <ns5:extendedDescription
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">
                </ns5:extendedDescription>
                <ns5:documentDate
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/"><document date>
                </ns5:documentDate>
                <ns5:documentType
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/"><document type>
                </ns5:documentType>
                <ns5:documentNumber
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/"><document number>
                </ns5:documentNumber>
                <ns5:securityOrganization
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">GSA
                </ns5:securityOrganization>
                <ns5:title
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/"><title>
                </ns5:title>
                <ns5:nameOfPerson
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">
                </ns5:nameOfPerson>
                <ns5:externalSystemId
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">GSAFLTGOV
                </ns5:externalSystemId>
                <ns5:contractNumber
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/"><contract number>
                </ns5:contractNumber>
                <ns5:vendorCode
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/"><vendor code>
                </ns5:vendorCode>
                <ns5:vendorAddressCode
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/"><vendor address code>
                </ns5:vendorAddressCode>
                <ns5:remitVendorAddressCode
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">00002
                </ns5:remitVendorAddressCode>
                <ns5:iPPPaymentTermsCode
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">00-00-30
                </ns5:iPPPaymentTermsCode>
                <ns5:eligibleForTransmissionToIPP
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/"><eligibility to transport to AAP>
                </ns5:eligibleForTransmissionToIPP>
               	<ns5:MomentumOrderItemizedLineRelation
										xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">
						<ns5:MomentumOrderItemizedLine>
                        <ns5:lineNumber>1</ns5:lineNumber>
                        <ns5:catalogNumber><catalog number></ns5:catalogNumber>
                        <ns5:commodityCode><commodity code></ns5:commodityCode>
                        <ns5:commodityName><commodity name></ns5:commodityName>
                        <ns5:unitOfMeasure><unit of measure></ns5:unitOfMeasure>
                        <ns5:quantity><quantity></ns5:quantity>
                        <ns5:iPPDescription></ns5:iPPDescription>
                        <ns5:iPPItemCode></ns5:iPPItemCode>
                        <ns5:iPPExportIndicator><export indicator></ns5:iPPExportIndicator>
                        <ns5:fundingOptions><funding options></ns5:fundingOptions>
                        <ns5:precreditUnitPriceTransactionAmount><priced unit priced amount transaction></ns5:precreditUnitPriceTransactionAmount>
                        <ns5:contractNumber>'#(<contract number>)'</ns5:contractNumber>
                        <ns5:contractLineItemNumber><contract item line></ns5:contractLineItemNumber>
                        <ns5:subContractLineItemNumber></ns5:subContractLineItemNumber>
                        <ns5:description><description></ns5:description>
                        <ns5:MomentumOrderItemizedAccountingLineRelation>
                            <ns5:MomentumOrderItemizedAccountingLine>
                                <ns5:lineNumber><line number></ns5:lineNumber>
                                <ns5:transactionType><transaction type></ns5:transactionType>
                                <ns5:promptPayType><prompt pay type></ns5:promptPayType>
                                <ns5:relatedCostIndicator><related cost indicator></ns5:relatedCostIndicator>
                                <ns5:periodPerformanceStartDate xsi:nil="true"></ns5:periodPerformanceStartDate>
                                <ns5:periodPerformanceEndDate></ns5:periodPerformanceEndDate>
                                <ns5:precreditLineTransactionAmount><precredit line transaction amount></ns5:precreditLineTransactionAmount>
                                <ns5:beginningBudgetFiscalYear><beginning budget FY></ns5:beginningBudgetFiscalYear>
                                <ns5:fund><fund></ns5:fund>
                                <ns5:division><division></ns5:division>
                                <ns5:organization><organization></ns5:organization>
                                <ns5:program><program></ns5:program>
                                <ns5:activity><activity></ns5:activity>
                                <ns5:budgetObject><budget object></ns5:budgetObject>
                            </ns5:MomentumOrderItemizedAccountingLine>
                        </ns5:MomentumOrderItemizedAccountingLineRelation>
                    </ns5:MomentumOrderItemizedLine>
                </ns5:MomentumOrderItemizedLineRelation>
            </ns:MomentumOrder>
        </ns:verifyAll>
    </soap:Body>
</soap:Envelope>
  """
    # .. and then we use the 'soap action'
    When soap action 'http://FTFixedAsset'
    Then status 200
    # note how we focus only on the relevant part of the payload and read expected XML from a file
    And print response
    And match /Envelope/Header/Body == read('expected.xml')

    Examples:
      | accounting period | order type | external system document number | document date | document type | document number | title             | contract number | vendor code | vendor address code | eligibility to transport to AAP | catalog number | commodity code | commodity name                   | unit of measure | quantity | export indicator | funding options | priced unit priced amount transaction | contract number | contract item line | description  | line number | transaction type | prompt pay type   | related cost indicator | precredit line transaction amount | beginning budget FY | fund   | division | organization | program | activity | budget object |
      | '01/23'           | 'D'        | RPN-N-NW764                     | '2022-10-21'  | 'VH'          | 'VHRPN-N-NW764' | 'VID202210170038' | '47QMCA19AAC14' | 135266470   | 002                 | 'T'                             | '57A.1'        | 25             | 'VEHICULAR EQUIPMENT COMPONENTS' | 'EA'            | 1        | 'S'              | 'T'             | 32913.0000                            | '47QMCA19AAC14' | '57A.1'            | 'CLNI Title' | 1           | 01               | 'NDS'             | 'N'                    | 32913.0000                        | 2023                | '285F' | 00       | 'Q00MDA00'   | 'TM12'  | 'AF158'  | 'M12'         |
      | 01/23             | D          | RPN-N-NW764                     | 2022-10-21    | VH            | VHRPN-N-NW764   | VID202210170038   | 47QMCA19AAC14   | 135266470   | 002                 | T                               | 57A.1          | 25             | VEHICULAR EQUIPMENT COMPONENTS   | EA              | 1        | S                | T               | 32913.0000                            | 47QMCA19AAC14   | 57A.1              | CLNI Title   | 1           | 01               | NDS               | N                      | 32913.0000                        | 2023                | 285F   | 00       | Q00MDA00     | TM12    | AF158    | M12           |
      | 01/23             | D          | RPN-N-NW764                     | 2022-10-21    | VH            | VHRPN-N-NW764   | VID202210170038   | 47QMCA19AAC14   | 135266470   | 002                 | T                               | 57A.1          | 25             | VEHICULAR EQUIPMENT COMPONENTS   | EA              | 1        | S                | T               | 32913.0000                            | 47QMCA19AAC14   | 57A.1              | CLNI Title   | 1           | 01               | NDS               | N                      | 32913.0000                        | 2023                | 285F   | 00       | Q00MDA00     | TM12    | AF158    | M12           |
      | 01/23             | D          | RPN-N-NW764                     | 2022-10-21    | VH            | VHRPN-N-NW764   | VID202210170038   | 47QMCA19AAC14   | 135266470   | 002                 | T                               | 57A.1          | 25             | VEHICULAR EQUIPMENT COMPONENTS   | EA              | 1        | S                | T               | 32913.0000                            | 47QMCA19AAC14   | 57A.1              | CLNI Title   | 1           | 01               | NDS               | N                      | 32913.0000                        | 2023                | 285F   | 00       | Q00MDA00     | TM12    | AF158    | M12           |
