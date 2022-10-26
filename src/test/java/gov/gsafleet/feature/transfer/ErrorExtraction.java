package gov.gsafleet.feature.transfer;

import java.util.HashMap;
import java.util.Map;

public class ErrorExtraction {

    public static Map<String,String> errorExtraction (String str){
        Map< String,String> errors =new HashMap<>();
            while(str.contains("errorCode")){
                int start=str.indexOf("errorCode")+10;
                int startErrorDescription = str.indexOf("errorDescription")+17;
                int endErrorDescription = str.indexOf("</errorDescription>");
                errors.put(str.substring(start,start+6),str.substring(startErrorDescription,endErrorDescription));
                str= str.substring(endErrorDescription+10);
            }
     return errors;
    }

    public static String fixException (Map <String,String> errors){
        String schemaXML="  <soap:Envelope xmlns:soap=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:fa=\"http://transfer.impl.webservices.ams.com\" xmlns:doc=\"http://doc.fa.domain.momentum.ams.com/\" xmlns:ref=\"http://ref.gs.domain.momentum.ams.com/\" xmlns:wor=\"http://workflow.gs.domain.momentum.ams.com/\" xmlns:gen=\"http://general.fo.domain.momentum.ams.com/\" xmlns:doc1=\"http://doc.gs.domain.momentum.ams.com/\">\n" +
                "   <soap:Header/>\n" +
                "   <soap:Body>\n" +
                "      <fa:create>\n" +
                "         <fa:MomentumAssetTransfer>\n" +
                "            <doc:accountingPeriod>10/2022</doc:accountingPeriod>\n" +
                "            <doc:assetNumber>ASSETEXAMPLE</doc:assetNumber>\n" +
                "            <doc:assetType>VEHICLE</doc:assetType>\n" +
                "            <doc:bettermentNumber>1</doc:bettermentNumber>\n" +
                "            <doc:description>FT Example</doc:description>\n" +
                "            <doc:dispositionTransactionType>02</doc:dispositionTransactionType>\n" +
                "            <doc:documentDate>2022-07-25</doc:documentDate>\n" +
                "            <doc:documentNumber>F5202207250104</doc:documentNumber>\n" +
                "            <doc:documentType>F5</doc:documentType>\n" +
                "            <doc:externalSystemId>GSAFLTGOV</doc:externalSystemId>\n" +
                "            <doc:newAssetNumber>ASSETEXAMPLE</doc:newAssetNumber>\n" +
                "            <doc:newAssetType>VEHSURPLUS</doc:newAssetType>\n" +
                "            <doc:newCapitalizedIndicator>true</doc:newCapitalizedIndicator>\n" +
                "            <doc:securityOrganization>GSA</doc:securityOrganization>\n" +
                "            <doc:title>FT Example</doc:title>\n" +
                "            <doc:transferDate>2022-07-25</doc:transferDate>\n" +
                "            <doc:MomentumAssetTransferLineRelation>\n" +
                "               <doc:MomentumAssetTransferLine>\n" +
                "                  <doc:activity>AF410</doc:activity>\n" +
                "                  <doc:beginningBudgetFiscalYear>2022</doc:beginningBudgetFiscalYear>\n" +
                "                  <doc:description>FT Example</doc:description>\n" +
                "                  <doc:division>02</doc:division>\n" +
                "                  <doc:fund>285F</doc:fund>\n" +
                "                  <doc:lineNumber>1</doc:lineNumber>\n" +
                "                  <doc:organization>Q00MDZ12</doc:organization>\n" +
                "                  <doc:program>TM11</doc:program>\n" +
                "                  <doc:transactionAmount>41337.28</doc:transactionAmount>\n" +
                "                  <doc:transactionType>02</doc:transactionType>\n" +
                "                  <doc:userDimension2>A01</doc:userDimension2>\n" +
                "                  <doc:userDimension3>G623201Y</doc:userDimension3>\n" +
                "               </doc:MomentumAssetTransferLine>\n" +
                "            </doc:MomentumAssetTransferLineRelation>\n" +
                "            <doc:transferMethod>T</doc:transferMethod>\n" +
                "            <doc:transferType>A</doc:transferType>\n" +
                "         </fa:MomentumAssetTransfer>\n" +
                "      </fa:create>\n" +
                "   </soap:Body>\n" +
                "</soap:Envelope>";
        if(errors.containsKey("FA0267E")){
            schemaXML=schemaXML.replace("<doc:bettermentNumber>1","<doc:bettermentNumber>0");
        }
        return schemaXML;
    }

}
