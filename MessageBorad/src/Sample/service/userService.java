package Sample.service;

import Sample.Bean.User;

public interface userService {

	void regis(User user);

	User getUser(String username);

	User login(User user);

}
