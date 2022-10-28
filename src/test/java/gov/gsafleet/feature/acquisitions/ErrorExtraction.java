package gov.gsafleet.feature.acquisitions;

import gov.gsafleet.feature.transfer.ErrorDescriptions;

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

        String schemaXML = " <soap:Envelope xmlns:soap=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:fa=\"http://assetacquisition.impl.webservices.ams.com\" xmlns:doc=\"http://doc.fa.domain.momentum.ams.com/\" xmlns:ref=\"http://ref.gs.domain.momentum.ams.com/\" xmlns:wor=\"http://workflow.gs.domain.momentum.ams.com/\" xmlns:gen=\"http://general.fo.domain.momentum.ams.com/\" xmlns:doc1=\"http://doc.gs.domain.momentum.ams.com/\">" +
                "   <soap:Header/>" +
                "   <soap:Body>" +
                "      <fa:create>" +
                "         <fa:MomentumAssetAcquisition>" +
                "            <doc:accountingPeriod>10/2022</doc:accountingPeriod>" +
                "            <doc:accrualUpdateAcquisitionCostFlag>false</doc:accrualUpdateAcquisitionCostFlag>" +
                "            <doc:acquisitionCostAmount>41337.28</doc:acquisitionCostAmount>" +
                "            <doc:acquisitionDate>2022-07-13</doc:acquisitionDate>" +
                "            <doc:acquisitionMethod>PURCHASE</doc:acquisitionMethod>" +
                "            <doc:MomentumAssetAcquisitionLineRelation>" +
                "               <doc:MomentumAssetAcquisitionLine>" +
                "                  <doc:activity>AF410</doc:activity>" +
                "                  <doc:beginningBudgetFiscalYear>2022</doc:beginningBudgetFiscalYear>" +
                "                  <doc:description>FA Example</doc:description>" +
                "                  <doc:division>02</doc:division>" +
                "                  <doc:fund>285F</doc:fund>" +
                "                  <doc:lineNumber>1</doc:lineNumber>" +
                "                  <doc:organization>Q00MDZ12</doc:organization>" +
                "                  <doc:program>TM11</doc:program>" +
                "                  <doc:transactionAmount>41337.28</doc:transactionAmount>" +
                "                  <doc:transactionType>01</doc:transactionType>" +
                "                  <doc:userDimension2>A01</doc:userDimension2>" +
                "                  <doc:userDimension3>G623201Y</doc:userDimension3>" +
                "               </doc:MomentumAssetAcquisitionLine>" +
                "            </doc:MomentumAssetAcquisitionLineRelation>" +
                "            <doc:assetNumber>ASSETEXAMPLE</doc:assetNumber>" +
                "            <doc:assetType>VEHICLE</doc:assetType>" +
                "            <doc:capitalizedIndicator>true</doc:capitalizedIndicator>" +
                "            <doc:depreciationMethod>SL</doc:depreciationMethod>" +
                "            <doc:description>FA Example</doc:description>" +
                "            <doc:documentDate>2022-07-13</doc:documentDate>" +
                "            <doc:documentNumber>F1202207130000</doc:documentNumber>" +
                "            <doc:documentType>F1</doc:documentType>" +
                "            <doc:externalSystemId>GSAFLTGOV</doc:externalSystemId>" +
                "            <doc:fuelCode>FUEL</doc:fuelCode>" +
                "            <doc:initialServiceDate>2022-07-13</doc:initialServiceDate>" +
                "            <doc:paymentUpdateAcquisitionCostFlag>false</doc:paymentUpdateAcquisitionCostFlag>" +
                "            <doc:quantity>1</doc:quantity>" +
                "            <doc:salvageValueAmount>4133.72</doc:salvageValueAmount>" +
                "            <doc:securityOrganization>GSA</doc:securityOrganization>" +
                "            <doc:title>FA Example</doc:title>" +
                "            <doc:usefulLife>95</doc:usefulLife>" +
                "            <doc:vendorAddressCode>00001</doc:vendorAddressCode>" +
                "            <doc:vendorCode>NF0000000</doc:vendorCode>" +
                "            <doc:yearOfManufacture>2022</doc:yearOfManufacture>" +
                "         </fa:MomentumAssetAcquisition>" +
                "      </fa:create>" +
                "   </soap:Body>" +
                "</soap:Envelope>";
        if (errors.containsKey("FA0267E")) {
            schemaXML = schemaXML.replace("<doc:bettermentNumber>1", "<doc:bettermentNumber>0");
        }
        if (errors.containsKey("GS0723E")) {
            schemaXML = schemaXML.replace("beginningBudgetFiscalYear>2022", "beginningBudgetFiscalYear>2023");
        }
        if (errors.containsKey("AS0072E")) {
            int indexDocumentNumber=schemaXML.indexOf("documentNumber>")+16;
            String documentNumber=schemaXML.substring(indexDocumentNumber,indexDocumentNumber+9);
            int docNumber=Integer.parseInt(documentNumber);
            ++docNumber;

            schemaXML = schemaXML.replace(documentNumber, ""+docNumber);
        }

            FileWriter file = new FileWriter("src/test/java/gov/gsafleet/feature/acquisitions/modified.xml");
            BufferedWriter writer = new BufferedWriter(file);
            writer.write(schemaXML);
            writer.close();

        return schemaXML;
    }

}
