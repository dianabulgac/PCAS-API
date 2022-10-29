package gov.gsafleet.feature.disposal;

import com.intuit.karate.junit5.Karate;

public class SpecificRunner {


    @Karate.Test
    Karate testCreateCreateAssetBetterment() {
        return Karate.run("create_asset_disposal").relativeTo(getClass());
    }


}


