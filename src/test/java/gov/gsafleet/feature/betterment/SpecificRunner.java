package gov.gsafleet.feature.betterment;

import com.intuit.karate.junit5.Karate;

public class SpecificRunner {


    @Karate.Test
    Karate testCreateCreateAssetBetterment() {
        return Karate.run("create_asset_acquisition_fix_errors").relativeTo(getClass());
    }


}


