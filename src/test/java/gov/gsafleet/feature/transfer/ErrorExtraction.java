package gov.gsafleet.feature.transfer;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class ErrorExtraction {

    public static Map<String, ErrorDescriptions> errorExtraction(String str) {

        Map<String, ErrorDescriptions> errors = new HashMap<>();
        while (str.contains("errorCode")) {
            ErrorDescriptions errorDescriptions = new ErrorDescriptions();
            int start = str.indexOf("errorCode") + 10;
            int startErrorDescription = str.indexOf("errorDescription") + 17;
            int endErrorDescription = str.indexOf("</errorDescription>");
            int startErrorField = str.indexOf("errorField") + 11;
            int endErrorField = str.indexOf("</errorField>");
            errorDescriptions.errorCode = str.substring(start, start + 7);
            errorDescriptions.errorDescription = str.substring(startErrorDescription, endErrorDescription);
            errorDescriptions.errorField = str.substring(startErrorField, endErrorField);

            errors.put(str.substring(start, start + 7), errorDescriptions);
            str = str.substring(endErrorField + 10);
        }
        return errors;
    }

    public static String fixException(Map<String, String> errors) throws IOException {

        String schemaXML = "  <soap:Envelope xmlns:soap=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:fa=\"http://transfer.impl.webservices.ams.com\" xmlns:doc=\"http://doc.fa.domain.momentum.ams.com/\" xmlns:ref=\"http://ref.gs.domain.momentum.ams.com/\" xmlns:wor=\"http://workflow.gs.domain.momentum.ams.com/\" xmlns:gen=\"http://general.fo.domain.momentum.ams.com/\" xmlns:doc1=\"http://doc.gs.domain.momentum.ams.com/\">" +
                "   <soap:Header/>" +
                "   <soap:Body>" +
                "      <fa:create>" +
                "         <fa:MomentumAssetTransfer>" +
                "            <doc:accountingPeriod>10/2022</doc:accountingPeriod>" +
                "            <doc:assetNumber>ASSETEXAMPLE</doc:assetNumber>" +
                "            <doc:assetType>VEHICLE</doc:assetType>" +
                "            <doc:bettermentNumber>1</doc:bettermentNumber>" +
                "            <doc:description>FT Example</doc:description>" +
                "            <doc:dispositionTransactionType>02</doc:dispositionTransactionType>" +
                "            <doc:documentDate>2022-07-25</doc:documentDate>" +
                "            <doc:documentNumber>F5202207250104</doc:documentNumber>" +
                "            <doc:documentType>F5</doc:documentType>" +
                "            <doc:externalSystemId>GSAFLTGOV</doc:externalSystemId>" +
                "            <doc:newAssetNumber>ASSETEXAMPLE</doc:newAssetNumber>" +
                "            <doc:newAssetType>VEHSURPLUS</doc:newAssetType>" +
                "            <doc:newCapitalizedIndicator>true</doc:newCapitalizedIndicator>" +
                "            <doc:securityOrganization>GSA</doc:securityOrganization>" +
                "            <doc:title>FT Example</doc:title>" +
                "            <doc:transferDate>2022-07-25</doc:transferDate>" +
                "            <doc:MomentumAssetTransferLineRelation>" +
                "               <doc:MomentumAssetTransferLine>" +
                "                  <doc:activity>AF410</doc:activity>" +
                "                  <doc:beginningBudgetFiscalYear>2022</doc:beginningBudgetFiscalYear>" +
                "                  <doc:description>FT Example</doc:description>" +
                "                  <doc:division>02</doc:division>" +
                "                  <doc:fund>285F</doc:fund>" +
                "                  <doc:lineNumber>1</doc:lineNumber>" +
                "                  <doc:organization>Q00MDZ12</doc:organization>" +
                "                  <doc:program>TM11</doc:program>" +
                "                  <doc:transactionAmount>41337.28</doc:transactionAmount>" +
                "                  <doc:transactionType>02</doc:transactionType>" +
                "                  <doc:userDimension2>A01</doc:userDimension2>" +
                "                  <doc:userDimension3>G623201Y</doc:userDimension3>" +
                "               </doc:MomentumAssetTransferLine>" +
                "            </doc:MomentumAssetTransferLineRelation>" +
                "            <doc:transferMethod>T</doc:transferMethod>" +
                "            <doc:transferType>A</doc:transferType>" +
                "         </fa:MomentumAssetTransfer>" +
                "      </fa:create>" +
                "   </soap:Body>" +
                "</soap:Envelope>";
        if (errors.containsKey("FA0267E")) {
            schemaXML = schemaXML.replace("<doc:bettermentNumber>1", "<doc:bettermentNumber>0");
        }
        if (errors.containsKey("GS0723E")) {
            schemaXML = schemaXML.replace("beginningBudgetFiscalYear>2022", "beginningBudgetFiscalYear>2023");
            schemaXML = schemaXML.replace("transferDate>2022-07-25","transferDate>2022-10-25");
            schemaXML = schemaXML.replace("documentDate>2022-07-25","documentDate>2022-10-25");

        }

            FileWriter file = new FileWriter("src/test/java/gov/gsafleet/feature/transfer/modified.xml");
            BufferedWriter writer = new BufferedWriter(file);
            writer.write(schemaXML);
            writer.close();


        return schemaXML;
    }

}
