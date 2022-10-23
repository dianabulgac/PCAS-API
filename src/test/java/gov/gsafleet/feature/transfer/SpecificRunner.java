package gov.gsafleet.feature.transfer;

import com.intuit.karate.junit5.Karate;

public class SpecificRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("call_and_resolve_transfer_data").relativeTo(getClass());
    }

}

