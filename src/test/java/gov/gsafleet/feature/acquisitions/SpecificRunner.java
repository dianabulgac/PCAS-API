package gov.gsafleet.feature.acquisitions;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.BeforeAll;

public class SpecificRunner {

    @BeforeAll
    public static void before(){
        System.setProperty("karate.env","qa");
    }



    @Karate.Test
    Karate testCreateCreateAssetAcquisition() {
        return Karate.run("create_asset_acquisition_fix_errors").relativeTo(getClass());
    }
    @Karate.Test
    Karate testDataBaseConnectionAndVAlidation() {
        return Karate.run("DataBaseConnectionAndValidation").relativeTo(getClass());
    }

    @Karate.Test
    Karate testAssetsAcquisitionDataDriven ()    {return Karate.run("create_asset_aquisition_data_driven").relativeTo(getClass());
    }


}


