package Sample.resource;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import Sample.Bean.Message;
import Sample.service.messageService;
import Sample.serviceImpl.messageServiceImpl;


@Path("/Message")
public class MessageResource {

	private messageService ms = new messageServiceImpl();
	
	@POST
	@Path("/showMessage")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Message> showMessage(@FormParam("message") String message,
			@FormParam("sendMessageUserName") String username){
		System.out.println(message);
		if(username.equals("")){
			username = "游客";
		}
		Date day=new Date();    
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(df.format(day));
		Message messageDetails = new Message();
		messageDetails.setMessageDetails(message);
		messageDetails.setCreatePerson(username);
		messageDetails.setIsVal(0);
		System.out.println(messageDetails.toString());
		messageDetails.setCreateTime(df.format(day));;
		ms.sendMessage(messageDetails);
		List<Message> list = ms.getPaMessage();
		return list;
	}
	
//	public List<Message> sendCommon(@FormParam("commomDetails") String commomDetails,
//			@FormParam("sendCommonUserName") String sendCommonUserName,
//			@FormParam("parentMessageId") Integer parentMessageId){
//		System.out.println(commomDetails);
//		if(sendCommonUserName.equals("")){
//			sendCommonUserName = "游客";
//		}
//		Date day=new Date();    
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		System.out.println(df.format(day));
//		Message common = new Message();
//		common.setCreatePerson(sendCommonUserName);
//		common.setMessageDetails(commomDetails);
//		try {
//			common.setCreateTime(df.parse(df.format(day)));
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		ms.sendCommon(common,parentMessageId);
//		List<Message> list = ms.getCommon();
//		return list;
//	}
	
	@POST
	@Path("/showAllMessage")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Message> showAllMessage(){
		System.out.println("show");
		List<Message> list = ms.getAllMessage();
		return list;
	}
	
	@POST
	@Path("/showNonMessage")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Message> showNonMessage(){
		List<Message> list = ms.getNonMessage();
		return list;
	}
	
	@POST
	@Path("/showPaMessage")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Message> showPaMessage(){
		List<Message> list = ms.getPaMessage();
		return list;
	}
	@POST
	@Path("/deleteMessage")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Message> deleteMessage(@FormParam(value = "a1") Integer messageId){
		System.out.println(messageId);
		ms.deleteById(messageId);
		List<Message> list = ms.getAllMessage();
		return list;
	}
	
	@POST
	@Path("/PassMessage")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Message> PassMessage(@FormParam(value = "a1") Integer messageId){
		System.out.println(messageId);
		ms.PassById(messageId);
		List<Message> list = ms.getNonMessage();
		return list;
	}
	
	@POST
	@Path("/RemoveMessage")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Message> RemoveMessage(@FormParam(value = "a1") Integer messageId){
		System.out.println(messageId);
		ms.RemoveById(messageId);
		List<Message> list = ms.getPaMessage();
		return list;
	}
}
