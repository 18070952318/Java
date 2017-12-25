package Sample.serviceImpl;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Sample.Bean.User;
import Sample.Dao.userDao;
import Sample.DaoImpl.userDaoImpl;
import Sample.service.userService;
import Utils.HibernateUtils;

public class userServiceImpl implements userService{
	private userDao ud = new userDaoImpl();

	@Override
	public void regis(User user) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction ts = session.beginTransaction();
		user.setIsRegis(1);
		try {
			ud.save(user);
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
		}
		ts.commit();
		
	}

	@Override
	public User getUser(String username) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction ts = session.beginTransaction();
		User user = null;
		try {
			user = ud.getUser(username);
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
		}
		ts.commit();
		return user;
	}
	
	@Override
	public User login(User user) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction ts = session.beginTransaction();
		User user2 = null;
		try {
			user2 = ud.getUser(user.getUsername());
			if(user2 != null){
				if(user2.getPassword().equals(user.getPassword())){
					return user2;
				}else{
					return null;
				}
			}else{
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
		}
		ts.commit();
		return null;
	}

}
