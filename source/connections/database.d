module rathena.database;

import hibernated.core;
import std.file : read;

class Database {
  private void getConfig(string applicationName) {
    auto file = read("../conf/inter_athena.conf");
  }

  public Connection getConnection() {
    try {
      Driver driver;
      string url;
      string[string] params;

      version (USE_MYSQL) {
        import ddbc.drivers.mysqlddbc;

        driver = new MySQLDriver();
        url = MySQLDriver.generateUrl("localhost", 3306, "test_db");
        params = MySQLDriver.setUserAndPassword("testuser", "123");
      } else version (USE_PGSQL) {
        import ddbc.drivers.pgsqlddbc;

        driver = new MySQLDriver();
        url = PGSQLDriver.generateUrl("/tmp", 5432, "testdb" );
        params = MySQLDriver.setUserAndPassword("testuser", "testpasswd");
      }

      auto ds = new ConnectionPoolDataSourceImpl(driver, url, params);
      auto connection = ds.getConnection();

      return connection;
    } catch (Exception ex) {
      throw ex;
    }
  }
}

unittest {
  auto database = new Database();
  database.getConfig("asdf");
}