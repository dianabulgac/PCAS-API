package gov.gsafleet;

import com.intuit.karate.junit5.Karate;
import org.junit.BeforeClass;

class AllFeatureRunner {

    @BeforeClass
    public static void before(){
        System.setProperty("karate.env","qa");
    }
    
    // this will run all *.feature files that exist in sub-directories
    // see https://github.com/intuit/karate#naming-conventions   
    @Karate.Test
    Karate testAll() {
        return new Karate().relativeTo(getClass());
    }
    
}
