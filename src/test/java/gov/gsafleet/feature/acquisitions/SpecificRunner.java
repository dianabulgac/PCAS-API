package gov.gsafleet.feature.acquisitions;

import com.intuit.karate.junit5.Karate;

public class SpecificRunner {


    @Karate.Test
    Karate testCreateCreateAssetAcquisition() {
        return Karate.run("create_asset_acquisition_fix_errors").relativeTo(getClass());
    }
    @Karate.Test
    Karate testDataBaseConnectionAndVAlidation() {
        return Karate.run("DataBaseConnectionAndValidation").relativeTo(getClass());
    }



}


