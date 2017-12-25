package Sample.DaoImpl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;


import Sample.Bean.User;
import Sample.Dao.userDao;
import Utils.HibernateUtils;

public class userDaoImpl implements userDao{

	@Override
	public void save(User user) {
		Session session = HibernateUtils.getCurrentSession();
		session.save(user);
	}

	@Override
	public User getUser(String username) {
		Session session = HibernateUtils.getCurrentSession();
		Criteria c = session.createCriteria(User.class);
		c.add(Restrictions.eq("username", username));
		User user = (User) c.uniqueResult();
		return user;
	}

}
