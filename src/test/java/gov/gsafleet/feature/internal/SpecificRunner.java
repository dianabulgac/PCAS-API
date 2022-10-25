package gov.gsafleet.feature.internal;

import com.intuit.karate.junit5.Karate;

public class SpecificRunner {

    @Karate.Test
    Karate testCallAndResolveData() {
        return Karate.run("order_price_change").relativeTo(getClass());
    }}



