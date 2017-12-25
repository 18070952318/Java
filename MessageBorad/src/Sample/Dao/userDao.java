package Sample.Dao;

import Sample.Bean.User;

public interface userDao {

	void save(User user);

	User getUser(String username);

}
