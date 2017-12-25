package Sample.Dao;

import java.util.List;

import Sample.Bean.Message;

public interface messageDao {

	void save(Message messageDetails);

	List<Message> getAll();

	List<Message> getAllNon();

	List<Message> getPaNon();

	List<Message> getCommon();

	void saveCommon(Message common, Integer parentsMessageId);

	void deleteById(Integer messageId);

	void PassById(Integer messageId);

	void RemoveById(Integer messageId);

}
