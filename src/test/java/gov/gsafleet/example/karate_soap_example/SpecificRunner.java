package gov.gsafleet.example.karate_soap_example;

import com.intuit.karate.junit5.Karate;

public class SpecificRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("soap_demo").relativeTo(getClass());
    }

}

