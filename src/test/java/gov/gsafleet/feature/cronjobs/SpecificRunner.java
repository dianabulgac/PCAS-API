package gov.gsafleet.feature.cronjobs;

import com.intuit.karate.junit5.Karate;

public class SpecificRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("CronJobs").relativeTo(getClass());
    }

}

