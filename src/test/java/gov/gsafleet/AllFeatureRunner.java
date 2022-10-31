package gov.gsafleet;

import com.intuit.karate.junit5.Karate;

import org.junit.jupiter.api.BeforeAll;


class AllFeatureRunner {


    @BeforeAll
    public static void before(){
        System.setProperty("karate.env","dev");
    }
    
    // this will run all *.feature files that exist in sub-directories
    // see https://github.com/intuit/karate#naming-conventions   


    @Karate.Test
    Karate testTags() {
        return Karate.run().tags("@create").relativeTo(getClass());
    }

    @Karate.Test
    Karate testAll() {
        return new Karate().relativeTo(getClass());
    }
}
