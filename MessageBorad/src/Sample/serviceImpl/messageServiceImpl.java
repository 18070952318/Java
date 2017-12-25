package Sample.serviceImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import Sample.Bean.Message;
import Sample.Dao.messageDao;
import Sample.DaoImpl.messageDaoImpl;
import Sample.service.messageService;
import Utils.HibernateUtils;

public class messageServiceImpl implements messageService{
	
	private messageDao md = new messageDaoImpl();

	@Override
	public void sendMessage(Message messageDetails) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction ts = session.beginTransaction();
		try {
			md.save(messageDetails);
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
		}
		ts.commit();
	}

	@Override
	public List<Message> getAllMessage() {
		Session session = HibernateUtils.getCurrentSession();
		Transaction ts = session.beginTransaction();
		List<Message> list = null;
		try {
			list = md.getAll();
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
		}
		ts.commit();
		return list;
	}

	@Override
	public List<Message> getNonMessage() {
		Session session = HibernateUtils.getCurrentSession();
		Transaction ts = session.beginTransaction();
		List<Message> list = null;
		try {
			list = md.getAllNon();
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
		}
		ts.commit();
		return list;
	}

	@Override
	public List<Message> getPaMessage() {
		Session session = HibernateUtils.getCurrentSession();
		Transaction ts = session.beginTransaction();
		List<Message> list = null;
		try {
			list = md.getPaNon();
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
		}
		ts.commit();
		return list;
	}

	@Override
	public void sendCommon(Message common,Integer parentsMessageId) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction ts = session.beginTransaction();
		try {
			md.saveCommon(common,parentsMessageId);
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
		}
		ts.commit();
		
	}

	@Override
	public List<Message> getCommon() {
		Session session = HibernateUtils.getCurrentSession();
		Transaction ts = session.beginTransaction();
		List<Message> list = null;
		try {
			list = md.getCommon();
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
		}
		ts.commit();
		return list;
	}

	@Override
	public void deleteById(Integer messageId) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction ts = session.beginTransaction();
		try {
			md.deleteById(messageId);
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
		}
		ts.commit();
	}

	@Override
	public void PassById(Integer messageId) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction ts = session.beginTransaction();
		try {
			md.PassById(messageId);
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
		}
		ts.commit();
		
	}

	@Override
	public void RemoveById(Integer messageId) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction ts = session.beginTransaction();
		try {
			md.RemoveById(messageId);
		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
		}
		ts.commit();
	}

	

}
