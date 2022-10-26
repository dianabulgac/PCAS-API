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

}
