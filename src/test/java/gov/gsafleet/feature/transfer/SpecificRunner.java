package gov.gsafleet.feature.transfer;

import com.intuit.karate.junit5.Karate;

public class SpecificRunner {

    @Karate.Test
    Karate testCallAndResolveData() {
        return Karate.run("call_and_resolve_transfer_data").relativeTo(getClass());
    }
    @Karate.Test
    Karate testCallAndResolve() {
        return Karate.run("call_and_resolve").relativeTo(getClass());
    }
    @Karate.Test
    Karate testCreateOrderDataDriven() {
        return Karate.run("create_order_data_driven").relativeTo(getClass());
    }

    @Karate.Test
    Karate testCreateCreateAssetTransfer() {
        return Karate.run("des_example_create_asset_transfer").relativeTo(getClass());
    }


}


