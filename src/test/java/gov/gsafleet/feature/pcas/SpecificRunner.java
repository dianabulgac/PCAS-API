package gov.gsafleet.feature.pcas;

import com.intuit.karate.junit5.Karate;

public class
SpecificRunner {

    @Karate.Test
    Karate testCorectionUnfieldVID() {
        return Karate.run("correction_unfilled_VID").relativeTo(getClass());
    }

}

