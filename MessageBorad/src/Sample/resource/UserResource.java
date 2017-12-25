package Sample.resource;




import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.sun.jersey.api.view.Viewable;

import Sample.Bean.User;
import Sample.service.userService;
import Sample.serviceImpl.userServiceImpl;


@Path("/user")
public class UserResource{
	private userService us = new userServiceImpl();
	
	@POST
	@Path("/login")
	@Produces(MediaType.APPLICATION_JSON)
	public User getUser( @FormParam("username") String username,
			@FormParam("password") String password){
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		System.out.println(user.toString());
		User isSucc = us.login(user);
		if(isSucc != null){
			System.out.println("1");
			return isSucc;
		}else{
			System.out.println("2");
			return user;

		}
		
	}
	
	
	@POST
	@Path("/regis")
	@Produces(MediaType.APPLICATION_JSON)
	public User regis(@FormParam("nickname") String nickname,
			@FormParam("username") String username,
			@FormParam("password") String password){
//		Date day=new Date();    
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
//		System.out.println(df.format(day));
		User user = new User();
		user.setNickname(nickname);
		user.setUsername(username);
		user.setPassword(password);
		user.setRoll(0);
		User oUser = us.getUser(user.getUsername());
		if(oUser != null){
			return oUser;
		}else{
			us.regis(user);
			user.setIsRegis(0);
			return user;
		}
	}
	
	@POST
	@Path("/adminLogin")
	@Produces(MediaType.APPLICATION_JSON)
	public User adminLogin(@FormParam("username") String username,
	@FormParam("password") String password){
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		System.out.println(user.toString());
		User adminUser = us.getUser(username);
		if(adminUser != null){
			return adminUser;
		}else{
			return user;
		}
		
	}
}
