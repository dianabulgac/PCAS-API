package gov.gsafleet.feature.transfer;



public class ErrorDescriptions {

   public String errorCode;
    public String errorDescription;
   public String errorField;

    @Override
    public String toString() {
        return "ErrorDescriptions{" +
                "errorCode='" + errorCode + '\'' +
                ", errorDescription='" + errorDescription + '\'' +
                ", errorField='" + errorField + '\'' +
                '}';
    }
}
