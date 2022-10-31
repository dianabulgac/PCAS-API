package gov.gsafleet.feature;


import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;
import java.io.File;
import java.util.*;

import static org.junit.jupiter.api.Assertions.assertEquals;


public class ParallelTesting {


    @Test
    public void testParallel() {
        Results results = Runner
             //   .path("classpath:gov.gs afleet.feature.acquisitions.create_asset_acquisition_fix_errors")

              //  .outputCucumberJson(true)
             //   .karateEnv("dev")
                .parallel(getClass(),5);
        generateReport(results.getReportDir());
        assertEquals(0,results.getFailCount());
    }


    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "pcas-api");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

}
