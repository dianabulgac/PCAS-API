Feature: Call asset Transfer Service and resolve errors between AFP and Pegasus

  Background:

    * url baseUrl
       # soap is just an HTTP POST, so here we set the required header manually ..
    * header Authorization = call read('basic-auth.js') { username: longin, password: password }

  Scenario: Call asset transfer with correct xml

    Given request read('itemizeOrderServeciClient_verifyAll.xml')
    # .. and then we use the 'soap action'
    When soap action 'http://FTFixedAsset'
    Then status 200
    # note how we focus only on the relevant part of the payload and read expected XML from a file
    And match /Envelope/Header/Body == read('expected.xml')

    Scenario: Call asset transfer with wrong datatype for

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
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">01/2023
                </ns5:accountingPeriod>
                <ns5:negotiatedPaymentDays
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">
                </ns5:negotiatedPaymentDays>
                <ns5:orderType
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">D
                </ns5:orderType>
                <ns5:externalSystemDocumentNumber
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">RPN-N-NW764
                </ns5:externalSystemDocumentNumber>
                <ns5:description
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/" xsi:nil="true">
                </ns5:description>
                <ns5:extendedDescription
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">
                </ns5:extendedDescription>
                <ns5:documentDate
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">2022-10-21
                </ns5:documentDate>
                <ns5:documentType
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">VH
                </ns5:documentType>
                <ns5:documentNumber
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">VHRPN-N-NW764
                </ns5:documentNumber>
                <ns5:securityOrganization
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">GSA
                </ns5:securityOrganization>
                <ns5:title
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">VID202210170038
                </ns5:title>
                <ns5:nameOfPerson
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">
                </ns5:nameOfPerson>
                <ns5:externalSystemId
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">GSAFLTGOV
                </ns5:externalSystemId>
                <ns5:contractNumber
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">47QMCA19AAC1&
                </ns5:contractNumber>
                <ns5:vendorCode
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">135266470
                </ns5:vendorCode>
                <ns5:vendorAddressCode
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">00002
                </ns5:vendorAddressCode>
                <ns5:remitVendorAddressCode
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">00002
                </ns5:remitVendorAddressCode>
                <ns5:iPPPaymentTermsCode
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">00-00-30
                </ns5:iPPPaymentTermsCode>
                <ns5:eligibleForTransmissionToIPP
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">T
                </ns5:eligibleForTransmissionToIPP>
                <ns5:MomentumOrderItemizedLineRelation
                        xmlns:ns5="http://doc.pe.domain.momentum.ams.com/">
                    <ns5:MomentumOrderItemizedLine>
                        <ns5:lineNumber>1</ns5:lineNumber>
                        <ns5:catalogNumber>57A.1  </ns5:catalogNumber>
                        <ns5:commodityCode>25</ns5:commodityCode>
                        <ns5:commodityName>VEHICULAR EQUIPMENT COMPONENTS</ns5:commodityName>
                        <ns5:unitOfMeasure>EA</ns5:unitOfMeasure>
                        <ns5:quantity>1</ns5:quantity>
                        <ns5:iPPDescription></ns5:iPPDescription>
                        <ns5:iPPItemCode></ns5:iPPItemCode>
                        <ns5:iPPExportIndicator>S</ns5:iPPExportIndicator>
                        <ns5:fundingOptions>P</ns5:fundingOptions>
                        <ns5:precreditUnitPriceTransactionAmount>32913.0000</ns5:precreditUnitPriceTransactionAmount>
                        <ns5:contractNumber>47QMCA19AAC14</ns5:contractNumber>
                        <ns5:contractLineItemNumber>57A.1</ns5:contractLineItemNumber>
                        <ns5:subContractLineItemNumber></ns5:subContractLineItemNumber>
                        <ns5:description>CLNI Title</ns5:description>
                        <ns5:MomentumOrderItemizedAccountingLineRelation>
                            <ns5:MomentumOrderItemizedAccountingLine>
                                <ns5:lineNumber>1</ns5:lineNumber>
                                <ns5:transactionType>01</ns5:transactionType>
                                <ns5:promptPayType>STD</ns5:promptPayType>
                                <ns5:relatedCostIndicator>N</ns5:relatedCostIndicator>
                                <ns5:periodPerformanceStartDate xsi:nil="true"></ns5:periodPerformanceStartDate>
                                <ns5:periodPerformanceEndDate></ns5:periodPerformanceEndDate>
                                <ns5:precreditLineTransactionAmount>32913.0000</ns5:precreditLineTransactionAmount>
                                <ns5:beginningBudgetFiscalYear>2023</ns5:beginningBudgetFiscalYear>
                                <ns5:fund>285F</ns5:fund>
                                <ns5:division>00</ns5:division>
                                <ns5:organization>Q00MDA00</ns5:organization>
                                <ns5:program>TM12</ns5:program>
                                <ns5:activity>AF158</ns5:activity>
                                <ns5:budgetObject>M12</ns5:budgetObject>
                            </ns5:MomentumOrderItemizedAccountingLine>
                        </ns5:MomentumOrderItemizedAccountingLineRelation>
                    </ns5:MomentumOrderItemizedLine>
                </ns5:MomentumOrderItemizedLineRelation>
            </ns:MomentumOrder>
        </ns:verifyAll>
    </soap:Body>
</soap:Envelope>
      """