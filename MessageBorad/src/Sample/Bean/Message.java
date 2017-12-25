package Sample.Bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.ws.rs.QueryParam;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "message")
public class Message implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@QueryParam("messageId")
	private Integer messageId;
	@QueryParam("messageDetails")
	private String messageDetails;
	@QueryParam("createPerson")
	private String createPerson;
	@QueryParam("createTime")
	private String createTime;
	@QueryParam("isVal")
	private Integer isVal;//是否通过验证发送到留言板
	public String getMessageDetails() {
		return messageDetails;
	}
	public void setMessageDetails(String messageDetails) {
		this.messageDetails = messageDetails;
	}
	public String getCreatePerson() {
		return createPerson;
	}
	public void setCreatePerson(String createPerson) {
		this.createPerson = createPerson;
	}
	
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public Integer getMessageId() {
		return messageId;
	}
	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public Integer getIsVal() {
		return isVal;
	}
	public void setIsVal(Integer isVal) {
		this.isVal = isVal;
	}

	

	
}
