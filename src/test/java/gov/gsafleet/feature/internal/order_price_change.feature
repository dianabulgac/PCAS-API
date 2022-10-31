Feature: Price change order

  Background:

    * url baseUrl
       # soap is just an HTTP POST, so here we set the required header manually ..
    * header Authorization = call read('basic-auth.js') { username: 'fleet_user', password: 'bS9AMRKfbC' }

  Scenario: Create internal direct agreement  with correct xml

    Given request
"""
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope
	xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:ns="http://internaldirectagreementdocument.impl.webservices.ams.com"
	xmlns:ns0="http://dms.domain.core.ams.com/"
	xmlns:ns2="http://security.sa.domain.momentum.ams.com/"
	xmlns:ns1="http://org.apache.axis2/xsd"
	xmlns:ns4="http://exceptions.webservices.core.ams.com/"
	xmlns:ns3="http://correspondence.domain.core.ams.com/"
	xmlns:ns6="http://doc.gs.domain.momentum.ams.com/"
	xmlns:ns5="http://query.pcas.domain.momentum.ams.com/"
	xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/"
	xmlns:ns7="http://general.fo.domain.momentum.ams.com/"
	xmlns:ns9="http://workflow.gs.domain.momentum.ams.com/"
	xmlns:tns="http://ref.gs.domain.momentum.ams.com/"
	xmlns:ax26="http://doc.pcas.domain.momentum.ams.com/">
	<soap:Header></soap:Header>
	<soap:Body>
		<ns:create
			xmlns:ns="http://internaldirectagreementdocument.impl.webservices.ams.com"
			xmlns="http://internaldirectagreementdocument.impl.webservices.ams.com">
			<ns:MomentumInternalDirectAgreement>
				<ns8:agreementNumber
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">FVID202210170172
				</ns8:agreementNumber>
				<ns8:agreementName
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">4764EA9094A158
				</ns8:agreementName>
				<ns8:endDate
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">2027-10-25
				</ns8:endDate>
				<ns8:activeFlag
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">true
				</ns8:activeFlag>
				<ns8:reimburseableFlag
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">true
				</ns8:reimburseableFlag>
				<ns8:fundingStatus
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">actual
				</ns8:fundingStatus>
				<ns8:documentType
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">VID
				</ns8:documentType>
				<ns8:documentNumber
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">VID202210240117
				</ns8:documentNumber>
				<ns8:securityOrganization
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">GSA
				</ns8:securityOrganization>
				<ns8:title
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">VID202210170172
				</ns8:title>
				<ns8:obligationsAffectAvailableFlag
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">false
				</ns8:obligationsAffectAvailableFlag>
				<ns8:commitmentsAffectAvailableFlag
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">false
				</ns8:commitmentsAffectAvailableFlag>
				<ns8:documentDate
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">2022-10-25
				</ns8:documentDate>
				<ns8:accountingPeriod
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">01/2023
				</ns8:accountingPeriod>
				<ns8:maximumAgreementTransactionAmount
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">1000
				</ns8:maximumAgreementTransactionAmount>
				<ns8:externalSystemId
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">GSAFLTGOVP
				</ns8:externalSystemId>
				<ns8:MomentumInternalDirectAgreementLineRelation
					xmlns:ns8="http://doc.pcas.domain.momentum.ams.com/">
					<ns8:MomentumInternalDirectAgreementLine>
						<ns8:agreementLineState>O</ns8:agreementLineState>
						<ns8:lineNumber>1</ns8:lineNumber>
						<ns8:transactionType>03</ns8:transactionType>
						<ns8:actualCostFlag>false</ns8:actualCostFlag>
						<ns8:agreementChargeFlag>true</ns8:agreementChargeFlag>
						<ns8:agreementLineNumber>1</ns8:agreementLineNumber>
						<ns8:spendingControlFlag>N</ns8:spendingControlFlag>
						<ns8:revenueControlFlag>R</ns8:revenueControlFlag>
						<ns8:transactionAmount>1000</ns8:transactionAmount>
						<ns8:customerPriorYearAdjustment>X</ns8:customerPriorYearAdjustment>
						<ns8:customerBeginningBudgetFiscalYear>2023</ns8:customerBeginningBudgetFiscalYear>
						<ns8:customerFund>285F</ns8:customerFund>
						<ns8:referencePartialFinalFlag>P</ns8:referencePartialFinalFlag>
						<ns8:customerVendorCode>4764EA</ns8:customerVendorCode>
						<ns8:customerVendorAddressCode>4764EA</ns8:customerVendorAddressCode>
						<ns8:sellerBeginningBudgetFiscalYear>2023</ns8:sellerBeginningBudgetFiscalYear>
						<ns8:sellerFund>285F</ns8:sellerFund>
						<ns8:sellerDivision xsi:nil="true"></ns8:sellerDivision>
						<ns8:sellerOrganization>Q00MDA00</ns8:sellerOrganization>
						<ns8:sellerProgram>TM12</ns8:sellerProgram>
						<ns8:sellerRevenueSource>4007</ns8:sellerRevenueSource>
						<ns8:billStartDate>2022-10-24</ns8:billStartDate>
						<ns8:billEndDate>2027-10-24</ns8:billEndDate>
						<ns8:billingControlOption>N</ns8:billingControlOption>
						<ns8:billCycle>At Completion</ns8:billCycle>
						<ns8:sellerActivity>AF157</ns8:sellerActivity>
					</ns8:MomentumInternalDirectAgreementLine>
				</ns8:MomentumInternalDirectAgreementLineRelation>
			</ns:MomentumInternalDirectAgreement>
		</ns:create>
	</soap:Body>
</soap:Envelope>
"""

	  And header Content-Type = 'application/soap+xml; charset=utf-8'
    # .. and then we use the 'method keyword' instead of 'soap action'
	  And path  "/IDDocumentService"
	  When method post
	  Then status 200
    # note how we focus only on the relevant part of the payload and read expected XML from a file
  ##  And match /Envelope/Header/Body/createResponse/MomentumInternalDirectAgreementReturn/maximumAgreementTransactionAmount== 1000

