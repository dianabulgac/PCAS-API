package gov.gsafleet.utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import java.util.List;
import java.util.Map;
public class DBUtils {
    private static final Logger logger = LoggerFactory.getLogger(DBUtils.class);
    private final JdbcTemplate jdbc;

    public DBUtils(String username, String password, String url) {

        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        jdbc = new JdbcTemplate(dataSource);
        logger.info("init jdbc template: {}", url);
    }
    public Object readValue(String query) {
        return jdbc.queryForObject(query, Object.class);
    }
    public Map<String, Object> readRow(String query) {
        return jdbc.queryForMap(query);
    }
    public List<Map<String, Object>> readRows(String query) {
        return jdbc.queryForList(query);
    }
    public void insertRows(final String sql){
        jdbc.batchUpdate(new String[]{sql});
    }
}
