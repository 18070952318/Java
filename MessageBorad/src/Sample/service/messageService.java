package Sample.service;

import java.util.List;

import Sample.Bean.Message;

public interface messageService {

	void sendMessage(Message messageDetails);

	List<Message> getAllMessage();

	List<Message> getNonMessage();

	List<Message> getPaMessage();

	void sendCommon(Message common, Integer parentMessageId);

	List<Message> getCommon();

	void deleteById(Integer messageId);

	void PassById(Integer messageId);

	void RemoveById(Integer messageId);




}
