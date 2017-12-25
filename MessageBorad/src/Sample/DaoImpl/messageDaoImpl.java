package Sample.DaoImpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import Sample.Bean.Message;
import Sample.Dao.messageDao;
import Utils.HibernateUtils;

public class messageDaoImpl implements messageDao {

	@Override
	public void save(Message messageDetails) {
		Session session = HibernateUtils.getCurrentSession();
		session.save(messageDetails);
	}

	@Override
	public List<Message> getAll() {
		System.out.println("dao");
		Session session = HibernateUtils.getCurrentSession();
		Criteria c = session.createCriteria(Message.class);
		return c.list();
	}

	@Override
	public List<Message> getAllNon() {
		Session session = HibernateUtils.getCurrentSession();
		Criteria c = session.createCriteria(Message.class);
		c.add(Restrictions.eq("isVal",0 ));
		return c.list();
	}

	@Override
	public List<Message> getPaNon() {
		Session session = HibernateUtils.getCurrentSession();
		Criteria c = session.createCriteria(Message.class);
		c.add(Restrictions.eq("isVal",1 ));
		return c.list();
	}

	@Override
	public List<Message> getCommon() {
		Session session = HibernateUtils.getCurrentSession();
		Criteria c = session.createCriteria(Message.class);
		c.add(Restrictions.isNotNull("Common"));
		return c.list();
	}

	@Override
	public void saveCommon(Message common,Integer parentsMessageId) {
		
	}

	@Override
	public void deleteById(Integer messageId) {
		Session session = HibernateUtils.getCurrentSession();
		Message message = session.load(Message.class, messageId);
		session.delete(message);
	}

	@Override
	public void PassById(Integer messageId) {
		Session session = HibernateUtils.getCurrentSession();
		Message message = session.load(Message.class, messageId);
		message.setIsVal(1);
		session.update(message);
		
	}

	@Override
	public void RemoveById(Integer messageId) {
		Session session = HibernateUtils.getCurrentSession();
		Message message = session.load(Message.class, messageId);
		message.setIsVal(0);
		session.update(message);
	}

}
