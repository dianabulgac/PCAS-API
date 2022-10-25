package gov.gsafleet.feature.pcas;

import com.intuit.karate.junit5.Karate;
import org.junit.BeforeClass;

public class
SpecificRunner {
    @BeforeClass
    public static void before(){
        System.setProperty("karate.env","qa");
    }
    @Karate.Test
    Karate testCorectionUnfieldVID() {


        return Karate.run("correction_unfilled_VID").relativeTo(getClass());
    }

}

